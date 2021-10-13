import logging

import Levenshtein as Lev
import torch

IGNORE_ID = -1


def config_logger(name,
                  console_level='INFO',
                  log_file=None,
                  file_level='INFO'):
    logger = logging.getLogger(name)
    logger.setLevel(logging.DEBUG)
    formatter = logging.Formatter(
        '%(asctime)s - %(name)s - %(levelname)s - %(message)s')

    if log_file is not None:
        file_handler = logging.FileHandler(log_file)
        file_handler.setLevel(file_level)
        file_handler.setFormatter(formatter)
        logger.addHandler(file_handler)

    console_handler = logging.StreamHandler()
    console_handler.setLevel(console_level)
    console_handler.setFormatter(formatter)
    logger.addHandler(console_handler)

    return logger


def pad_list(xs, pad_value):
    n_batch = len(xs)
    max_len = max(x.size(0) for x in xs)
    pad = xs[0].new(n_batch, max_len, *xs[0].size()[1:]).fill_(pad_value)
    for i in range(n_batch):
        pad[i, :xs[i].size(0)] = xs[i]
    return pad


def calculate_wer(s1, s2, word_sep=' '):
    """
    Computes the Word Error Rate, defined as the edit distance between the
    two provided sentences after tokenizing to words.
    Arguments:
        s1 (string): space-separated sentence
        s2 (string): space-separated sentence
    """
    # build mapping of words to integers
    s1words = []
    for line in s1.splitlines():
        s1words.extend(line.split(word_sep))
    s2words = []
    for line in s2.splitlines():
        s2words.extend(line.split(word_sep))

    b = set(s1words + s2words)
    word2char = dict(zip(b, range(len(b))))

    # map the words to a char array (Levenshtein packages only accepts
    # strings)
    w1 = [chr(word2char[w]) for w in s1words]
    w2 = [chr(word2char[w]) for w in s2words]

    return Lev.distance(''.join(w1), ''.join(w2)), len(s1words), len(s2words)


def calculate_cer(s1, s2, word_sep=' '):
    """
    Computes the Character Error Rate, defined as the edit distance.

    Arguments:
        s1 (string): space-separated sentence
        s2 (string): space-separated sentence
    """
    s1, s2 = s1.replace(word_sep, '\n'), s2.replace(word_sep, '\n')
    s1, s2 = "".join(s1.splitlines()), "".join(s2.splitlines())
    return Lev.distance(s1, s2), len(s1), len(s2)


def calculate_ler(s1, s2):
    """
    Computes the Label Error Rate, defined as the edit distance.

    Arguments:
        s1 (string): sentence 1
        s2 (string): sentence 2
    """
    return Lev.distance(s1, s2), len(s1), len(s2)


def load_model(path):
    package = torch.load(path, map_location=lambda storage, loc: storage)
    if package['name'] == 'deepspeech':
        from audio2score.deepspeech.model import DeepSpeech
        model = DeepSpeech(package['model_conf'], package['audio_conf'],
                           package['labels'])
    else:
        raise NotImplementedError

    model.load_state_dict(package['state_dict'])
    return model, package


def save_model(model,
               path,
               optimizer=None,
               epoch=None,
               train_results=None,
               val_results=None,
               avg_loss=None,
               meta=None):
    package = {
        'name': model.name,
        'version': model.version,
        'model_conf': model.model_conf,
        'audio_conf': model.audio_conf,
        'labels': model.labels,
        'state_dict': model.state_dict(),
    }
    if optimizer is not None:
        package['optim_dict'] = optimizer.state_dict()
    if avg_loss is not None:
        package['avg_loss'] = avg_loss
    if epoch is not None:
        package['epoch'] = epoch
    if train_results is not None:
        package['train_results'] = train_results
        package['val_results'] = val_results
    if meta is not None:
        package['meta'] = meta
    torch.save(package, path)
    return


class LabelDecoder(object):
    def __init__(self, labels):
        self.labels_map_inv = dict([(i, c) for (i, c) in enumerate(labels)])

    def decode(self, tokens):
        return "".join(
            list(filter(None, [self.labels_map_inv.get(t) for t in tokens])))


class AverageMeter(object):
    """Computes and stores the average and current value"""
    def __init__(self):
        self.value = 0
        self.reset()

    def reset(self):
        self.value = 0
        self.avg = 0
        self.sum = 0
        self.count = 0

    def update(self, value, n=1):
        self.value = value
        self.sum += value * n
        self.count += n
        self.avg = self.sum / self.count
