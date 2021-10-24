import argparse
import configparser
import csv
import json
import os
import random
import subprocess
import time
from datetime import datetime
from pathlib import Path

import numpy as np
import torch
import torch.distributed as dist
import torch.utils.data.distributed
from apex import amp
from apex.parallel import DistributedDataParallel
from tqdm import tqdm

from audio2score.data.data_loader import (AudioDataLoader, BucketingSampler,
                                          DistributedBucketingSampler, SpectrogramDataset)
from audio2score.utils import (AverageMeter, LabelDecoder, calculate_cer, calculate_ler,
                               calculate_wer, config_logger, load_model, save_model, parseIntList)


def create_base_parser():
    parser = argparse.ArgumentParser(description='Audio2Score training', add_help=False)
    parser.add_argument('--data-dir',
                        metavar='DIR',
                        required=True,
                        help='Dataset label, train and validation manifests folder')
    parser.add_argument('--data-id',
                        default='manifest',
                        help='Id of manifest and label files')
    parser.add_argument('--config-path',
                        metavar='DIR',
                        required=True,
                        help='path to configuration ini')
    parser.add_argument('--model-path',
                        metavar='DIR',
                        required=True,
                        help='Location to save best validation model')

    parser.add_argument('--continue-from',
                        metavar='DIR',
                        help='Continue from checkpoint model')
    parser.add_argument('--num-workers',
                        default=4,
                        type=int,
                        help='Number of workers used in data-loading')
    parser.add_argument('--no-cuda',
                        action='store_true',
                        help='Do not use cuda to train model')
    parser.add_argument('--silent',
                        dest='silent',
                        action='store_true',
                        help='Turn off progress tracking per iteration')
    parser.add_argument('--finetune',
                        dest='finetune',
                        action='store_true',
                        help='Finetune the model from checkpoint "continue_from"')

    parser.add_argument('--seed', default=45, type=int, help='Seed to generators')
    parser.add_argument('--mixed-precision',
                        action='store_true',
                        help='Uses mixed precision to train a model '
                        '(suggested with volta and above)')

    parser.add_argument('--device-ids',
                        type=parseIntList,
                        help='Select the GPU ids to use in multi-GPU',
                        default=None)
    parser.add_argument('--dist-url',
                        default='tcp://127.0.0.1:1550',
                        type=str,
                        help='url used to set up distributed training')
    parser.add_argument('--dist-backend',
                        default='nccl',
                        type=str,
                        help='Distributed backend')
    parser.add_argument('--world-size',
                        default=1,
                        type=int,
                        # help='number of distributed processes',
                        help=argparse.SUPPRESS)
    parser.add_argument('--rank',
                        default=0,
                        type=int,
                        # help='The rank of this process',
                        help=argparse.SUPPRESS)
    parser.add_argument('--gpu-rank',
                        default=None,
                        # help='If using distributed parallel for multi-gpu, '
                        # 'sets the GPU for the process',
                        help=argparse.SUPPRESS)

    return parser


def main():

    base_parser = create_base_parser()
    parser = argparse.ArgumentParser(description='Audio2Score training', parents=[base_parser])
    for dest in ['dist_url', 'dist_backend', 'device_ids']:
        idx = [a.dest for a in parser._actions].index(dest)
        parser._actions[idx].help = argparse.SUPPRESS
    args = parser.parse_args()

    train(args)


def main_multi_gpu():

    base_parser = create_base_parser()
    # Multi-GPU
    parser = argparse.ArgumentParser(
        description='Audio2Score Multi-GPU training', parents=[base_parser])
    args = parser.parse_args()

    workers = []
    args.world_size = torch.cuda.device_count()
    device_ids = args.device_ids
    del args.device_ids

    if device_ids:  # Manually specified GPU IDs
        args.world_size = len(device_ids)

    for i in range(args.world_size):
        args.rank = i
        if device_ids:
            args.gpu_rank = device_ids[i]
        else:
            args.gpu_rank = i

        stdout = None if i == 0 else open("GPU_" + str(i) + ".log", "w")
        arglist = []
        for key, value in vars(args).items():
            if str(value) and str(value) != 'False' and str(value) != 'None':
                arglist.append(f"--{key.replace('_', '-')}")
                if str(value) != 'True':
                    arglist.append(str(value))

        p = subprocess.Popen(['a2s-train'] + arglist,
                             stdout=stdout,
                             stderr=stdout)
        workers.append(p)

    for p in workers:
        p.wait()
        if p.returncode != 0:
            raise subprocess.CalledProcessError(returncode=p.returncode,
                                                cmd=p.args)


def train(args):
    config = configparser.ConfigParser()

    args.model_path = Path(args.model_path).with_suffix('.pth')
    save_folder = os.path.dirname(args.model_path)
    if not save_folder:
        save_folder = './'
    os.makedirs(save_folder, exist_ok=True)  # Ensure save folder exists
    # Logging config.
    train_job = f"train_{args.rank}_{args.model_path.with_suffix('.log').name}"
    log_file = f'{save_folder}/{datetime.now().strftime("%Y%m%d-%H%M%S")}_{train_job}'
    logger = config_logger('train', log_file=log_file)

    # Main execution.
    # Get train config.
    config.read(args.config_path)
    model_name = config['train']['model']
    model_conf = config[model_name]
    audio_conf = config['audio']

    if model_name == "deepspeech":
        from audio2score.deepspeech.loss import Loss
        from audio2score.deepspeech.model import DeepSpeech as Model
    else:
        raise NotImplementedError

    train_conf = config['train']
    batch_size = train_conf.getint('batch_size')
    epochs = train_conf.getint('epochs')
    shuffle = train_conf.getboolean('shuffle', True)
    sorta_grad = train_conf.getboolean('sorta_grad', True)

    # Set seeds for determinism
    torch.manual_seed(args.seed)
    torch.cuda.manual_seed_all(args.seed)
    np.random.seed(args.seed)
    random.seed(args.seed)

    # Mixed precision.
    if args.mixed_precision and args.no_cuda:
        raise ValueError(
            'If using mixed precision training, CUDA must be enabled!')

    # Distributed training.
    args.distributed = args.world_size > 1
    main_proc = True
    device = torch.device("cpu" if args.no_cuda else "cuda")
    if not args.no_cuda:
        torch.cuda.set_per_process_memory_fraction(0.5, torch.cuda.current_device())

    if args.distributed:
        if args.gpu_rank:
            torch.cuda.set_device(int(args.gpu_rank))
        dist.init_process_group(backend=args.dist_backend,
                                init_method=args.dist_url,
                                world_size=args.world_size,
                                rank=args.rank)
        main_proc = args.rank == 0  # Only the first proc should save models

    # Allocation of results.
    train_results, val_results = torch.Tensor(epochs), torch.Tensor(epochs)
    best_wer = None
    last_model_path = args.model_path.with_suffix('.last.pth')

    results_path = args.model_path.with_suffix('.csv')
    with open(results_path, 'a') as resfile:
        wr = csv.writer(resfile)
        wr.writerow([
            'Epoch', 'Train Loss', 'Val WER', 'Val CER', 'Val LER',
            'Train Time', 'Val Time'
        ])

    batch_time = AverageMeter()
    data_time = AverageMeter()
    train_losses = AverageMeter()

    # Model instatiation.
    train_loss, start_epoch, optim_state = 0, 0, None
    if args.continue_from:  # Starting from previous model
        logger.info(f"Loading checkpoint model {args.continue_from}")
        model, package = load_model(args.continue_from)
        labels = model.labels
        audio_conf = model.audio_conf
        model_conf = model.model_conf
        if not args.finetune:  # Don't want to restart training
            optim_state = package['optim_dict']
            start_epoch = int(package.get(
                'epoch', 0)) + 1  # Index start at 0 for training
            train_loss = int(package.get('avg_loss', 0))
            for i in range(start_epoch):
                train_results[i] = package['train_results'][i]
                val_results[i] = package['val_results'][i]
            best_wer = float(val_results[:start_epoch].min())
    else:
        with open(Path(args.data_dir) / f'labels_{args.data_id}.json') as label_file:
            labels = json.load(label_file)

        model = Model(model_conf, audio_conf, labels)

    model = model.to(device)

    # Data inputs configuration
    train_manifest = Path(args.data_dir) / f'train_{args.data_id}.csv'
    val_manifest = Path(args.data_dir) / f'val_{args.data_id}.csv'

    train_dataset = SpectrogramDataset(audio_conf=audio_conf,
                                       manifest_filepath=train_manifest,
                                       labels=labels)
    val_dataset = SpectrogramDataset(audio_conf=audio_conf,
                                     manifest_filepath=val_manifest,
                                     labels=labels)
    label_decoder = LabelDecoder(labels)

    if not args.distributed:
        train_sampler = BucketingSampler(train_dataset, batch_size=batch_size)
        val_sampler = BucketingSampler(val_dataset, batch_size=batch_size)
    else:
        train_sampler = DistributedBucketingSampler(
            train_dataset,
            batch_size=batch_size,
            num_replicas=args.world_size,
            rank=args.rank)
        val_sampler = DistributedBucketingSampler(val_dataset,
                                                  batch_size=batch_size,
                                                  num_replicas=args.world_size,
                                                  rank=args.rank)

    train_loader = AudioDataLoader(train_dataset,
                                   num_workers=args.num_workers,
                                   batch_sampler=train_sampler)
    val_loader = AudioDataLoader(val_dataset,
                                 num_workers=args.num_workers,
                                 batch_sampler=val_sampler)

    if (shuffle and start_epoch != 0) or not sorta_grad:
        logger.info("Shuffling batches for the following epochs")
        train_sampler.shuffle(start_epoch)
    val_sampler.shuffle(1)

    # Optimizer.
    optim_name = train_conf['optimizer']
    optim_conf = config[optim_name]
    parameters = model.parameters()
    learning_rate = train_conf.getfloat('learning_rate')
    max_norm = train_conf.getfloat('max_norm')
    if optim_name == 'rmsprop':
        optimizer = torch.optim.RMSprop(
            parameters,
            lr=learning_rate,
            alpha=optim_conf.getfloat('alpha', 0.95),
            eps=optim_conf.getfloat('epsilon', 1e-8))
    elif optim_name == 'adam':
        betas = [
            optim_conf.getfloat('beta1', 0.9),
            optim_conf.getfloat('beta2', 0.999)
        ]
        optimizer = torch.optim.Adam(parameters, lr=learning_rate, betas=betas)
    elif optim_name == 'sgd':
        optimizer = torch.optim.SGD(
            parameters,
            lr=learning_rate,
            momentum=optim_conf.getfloat('momentum', 0.9),
            nesterov=optim_conf.getboolean('nesterov', True))
    else:
        raise NotImplementedError

    if not args.no_cuda:
        if not args.mixed_precision:
            model, optimizer = amp.initialize(model, optimizer, opt_level='O0')
        else:
            model, optimizer = amp.initialize(model, optimizer, opt_level='O1')
    else:
        model, optimizer = amp.initialize(model, optimizer, opt_level='O0', enabled=False)

    if args.distributed:
        model = DistributedDataParallel(model, delay_allreduce=True)
        modelbase = model.module
    else:
        modelbase = model

    logger.info(model)
    logger.info(f"Number of parameters: {Model.get_param_size(model)}")

    if optim_state is not None:
        optimizer.load_state_dict(optim_state)

    # Loss and LR scheduler.
    criterion = Loss(model, device)
    scheduler = torch.optim.lr_scheduler.StepLR(
        optimizer, step_size=1, gamma=train_conf.getfloat('learning_anneal'))

    # Main train loop.
    for epoch in range(start_epoch, epochs):
        model.train()
        end = time.time()
        start_epoch_time = time.time()
        for i, (data) in enumerate(train_loader):
            inputs, targets, input_sizes, target_sizes, filenames = data
            # measure data loading time
            data_time.update(time.time() - end)

            loss_value = 0
            try:
                loss = criterion.calculate_loss(inputs, input_sizes, targets,
                                                target_sizes)
            except Exception as error:
                logger.error(error)
                logger.error('Skipping grad update')
            else:
                optimizer.zero_grad()
                # compute gradient
                with amp.scale_loss(loss, optimizer) as scaled_loss:
                    scaled_loss.backward()
                # clip gradients
                if max_norm:
                    torch.nn.utils.clip_grad_norm_(
                        amp.master_params(optimizer), max_norm)
                # update parameters
                optimizer.step()
                if args.distributed:
                    dist.all_reduce(loss, op=dist.ReduceOp.SUM)
                    loss_value = loss.item() / args.world_size
                else:
                    loss_value = loss.item()

            train_loss += loss_value
            train_losses.update(loss_value, batch_size)

            # measure elapsed time
            batch_time.update(time.time() - end)
            end = time.time()

            if not args.silent:
                # Batch logging.
                logger.info(
                    f'Epoch: [{epoch + 1}][{i + 1}/{len(train_sampler)}]\t'
                    f'Time {batch_time.value:.3f} ({batch_time.avg:.3f})\t'
                    f'Data {data_time.value:.3f} ({data_time.avg:.3f})\t'
                    f'Loss {train_losses.value:.4f} ({train_losses.avg:.4f})\t'
                )

        train_loss /= len(train_sampler)

        # Train epoch logging.
        epoch_time = time.time() - start_epoch_time
        logger.info(
            f'Training Summary Epoch: [{epoch + 1}]\t'
            f'Time taken (s): {epoch_time:.0f}\t'
            f'Average Loss {train_loss:.3f}\t'
        )

        # Validation evaluation.
        val_wer, val_cer, val_ler, num_words, num_chars, num_labels = 0, 0, 0, 0, 0, 0
        model.eval()
        with torch.no_grad():
            for i, (data) in tqdm(enumerate(val_loader),
                                  total=len(val_loader),
                                  ascii=True):
                inputs, targets, input_sizes, target_sizes, filenames = data
                inputs = inputs.to(device)
                input_sizes = input_sizes.to(device)
                transcripts = modelbase.transcribe(inputs, input_sizes)
                for i, target in enumerate(targets):
                    reference = label_decoder.decode(
                        target[:target_sizes[i]].tolist())
                    transcript = label_decoder.decode(transcripts[i])
                    wer, trans_words, ref_words = calculate_wer(
                        transcript, reference, '\t')
                    cer, trans_chars, ref_chars = calculate_cer(
                        transcript, reference, '\t')
                    ler, trans_labels, ref_labels = calculate_ler(
                        transcript, reference)
                    val_wer += wer
                    num_words += ref_words
                    val_cer += cer
                    num_chars += ref_chars
                    val_ler += ler
                    num_labels += ref_labels

            if args.distributed:
                result_tensor = torch.tensor([
                    val_wer, val_cer, val_ler, num_words, num_chars, num_labels
                ]).to(device)
                dist.all_reduce(result_tensor, op=dist.ReduceOp.SUM)
                val_wer, val_cer, val_ler, num_words, num_chars, num_labels = result_tensor

            val_wer = 100 * float(val_wer) / num_words
            val_cer = 100 * float(val_cer) / num_chars
            val_ler = 100 * float(val_ler) / num_labels
            val_time = time.time() - start_epoch_time - epoch_time
            logger.info(
                f'Validation Summary Epoch: [{epoch + 1}]\tTime taken (s): {val_time:.0f}\t'
                f'Average WER {val_wer:.3f}\tAverage CER {val_cer:.3f}\tAverage LER {val_ler:.3f}'
            )

        # Saving results: log to csv and save model.
        if main_proc:
            train_results[epoch] = train_loss
            val_results[epoch] = val_wer
            with open(results_path, 'a') as resfile:
                wr = csv.writer(resfile)
                wr.writerow([
                    epoch + 1, train_loss, val_wer, val_cer, val_ler,
                    int(epoch_time),
                    int(val_time)
                ])

            if best_wer is None or best_wer > val_wer:
                logger.info(
                    f"Found better validated model, saving to {args.model_path}"
                )
                save_model(modelbase,
                           args.model_path,
                           optimizer=optimizer,
                           epoch=epoch,
                           train_results=train_results,
                           val_results=val_results)
                best_wer = val_wer
            else:
                save_model(modelbase,
                           str(last_model_path),
                           optimizer=optimizer,
                           epoch=epoch,
                           train_results=train_results,
                           val_results=val_results)

        # Prepare next epoch.
        train_loss = 0
        scheduler.step()
        if shuffle:
            logger.info("Shuffling batches...")
            train_sampler.shuffle(epoch)


if __name__ == '__main__':
    main()
