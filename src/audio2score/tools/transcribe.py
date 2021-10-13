import argparse

import torch

from audio2score.data.data_loader import SpectrogramParser
from audio2score.utils import LabelDecoder, load_model


def transcribe(model_path, audio_path, cuda=False):
    model, _ = load_model(model_path)
    device = torch.device("cuda" if cuda else "cpu")
    label_decoder = LabelDecoder(model.labels)
    model.eval()
    model = model.to(device)

    parser = SpectrogramParser(model.audio_conf)
    spect = parser.parse_audio(audio_path).contiguous()
    spect = spect.view(1, spect.size(0), spect.size(1))
    spect = spect.to(device)
    input_sizes = torch.IntTensor([spect.size(1)])
    input_sizes.to(device)

    transcripts = model.transcribe(spect, input_sizes)
    print(label_decoder.decode(transcripts[0]))


def main():
    parser = argparse.ArgumentParser(
        description='Audio2Score transcription',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('--model-path',
                        help='Path to model file.',
                        required=True)
    parser.add_argument('--audio-path',
                        help='Audio file to predict on.',
                        required=True)
    parser.add_argument('--cuda',
                        action="store_true",
                        default=False,
                        help='Use cuda to test model')
    args = parser.parse_args()

    transcribe(args.model_path, args.audio_path, args.cuda)

if __name__ == '__main__':
    main()