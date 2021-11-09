import math
from collections import OrderedDict

import numpy as np

import torch
import torch.nn as nn
import torch.nn.functional as F

import audio2score.models.common as common

supported_rnns = {'lstm': nn.LSTM, 'rnn': nn.RNN, 'gru': nn.GRU}

windows = {
    'hamming': np.hamming,
    'hanning': np.hanning,
    'blackman': np.blackman,
    'bartlett': np.bartlett
}


class BatchRNN(nn.Module):
    def __init__(self,
                 input_size,
                 hidden_size,
                 rnn_type=nn.LSTM,
                 bidirectional=False,
                 batch_norm=True):
        super(BatchRNN, self).__init__()
        self.input_size = input_size
        self.hidden_size = hidden_size
        self.bidirectional = bidirectional
        self.batch_norm = common.SequenceWise(
            nn.BatchNorm1d(input_size)) if batch_norm else None
        self.rnn = rnn_type(input_size=input_size,
                            hidden_size=hidden_size,
                            bidirectional=bidirectional,
                            bias=True)
        self.num_directions = 2 if bidirectional else 1

    def flatten_parameters(self):
        self.rnn.flatten_parameters()

    def forward(self, x, output_lengths):
        if self.batch_norm is not None:
            x = self.batch_norm(x)
        x = nn.utils.rnn.pack_padded_sequence(x, output_lengths.cpu())
        x, h = self.rnn(x)
        x, _ = nn.utils.rnn.pad_packed_sequence(x)
        if self.bidirectional:
            x = x.view(x.size(0), x.size(1), 2,
                       -1).sum(2).view(x.size(0), x.size(1),
                                       -1)  # (TxNxH*2) -> (TxNxH) by sum
        return x


class Lookahead(nn.Module):
    # Wang et al 2016 - Lookahead Convolution Layer for Unidirectional
    # Recurrent Neural Networks
    # input shape - sequence, batch, feature - TxNxH
    # output shape - same as input
    def __init__(self, n_features, context):
        super(Lookahead, self).__init__()
        assert context > 0
        self.context = context
        self.n_features = n_features
        self.pad = (0, self.context - 1)
        self.conv = nn.Conv1d(self.n_features,
                              self.n_features,
                              kernel_size=self.context,
                              stride=1,
                              groups=self.n_features,
                              padding=0,
                              bias=None)

    def forward(self, x):
        x = x.transpose(0, 1).transpose(1, 2)
        x = F.pad(x, pad=self.pad, value=0)
        x = self.conv(x)
        x = x.transpose(1, 2).transpose(0, 1).contiguous()
        return x

    def __repr__(self):
        return self.__class__.__name__ + '(' \
            + 'n_features=' + str(self.n_features) \
            + ', context=' + str(self.context) + ')'


class DeepSpeech(nn.Module):
    def __init__(self, model_conf, audio_conf, labels):
        super(DeepSpeech, self).__init__()

        # model metadata needed for serialization/deserialization
        self.name = 'deepspeech'
        self.version = '2.0.0'
        self.model_conf = model_conf
        self.audio_conf = audio_conf
        self.labels = labels

        conv_channels = self.model_conf.getint('conv_channels', 8)
        self.frame_multiplier = self.model_conf.getint('frame_multiplier', 1)
        rnn_type = self.model_conf.get('rnn_type', 'lstm')
        hidden_size = self.model_conf.getint('hidden_size', 1024)
        hidden_layers = self.model_conf.getint('hidden_layers', 3)
        bidirectional = self.model_conf.getboolean('bidirectional', True)
        context = self.model_conf.getint('lookahead_context', 40)
        dropout = self.model_conf.getfloat('dropout', 0.0)
        batchnorm = self.model_conf.getboolean('batchnorm', True)

        # Read audio configuration
        input_format = self.audio_conf.get("input_format", 'stft')
        sample_rate = self.audio_conf.getint("sample_rate", 22050)
        window_size = self.audio_conf.getfloat("window_size", 0.09288)
        # window_stride = self.audio_conf.getfloat("window_stride", 0.02322)
        # window = windows.get(self.audio_conf['window'], windows['hamming'])
        bins_per_octave = self.audio_conf.getint("bins_per_octave")
        num_octaves = self.audio_conf.getint("num_octaves")

        num_classes = len(self.labels)

        if input_format == 'stft':
            cnn_kernel_sizes = [(9, 3), (3, 3)]
            cnn_strides = [(2, 1), (2, 1)]
            cnn_paddings = [(4, 1), (1, 1)]
            rnn_input_size = int(math.floor((sample_rate * window_size) / 2))
        else:
            cnn_kernel_sizes = [(3, 3), (3, 3)]
            cnn_strides = [(1, 1), (2, 1)]
            cnn_paddings = [(1, 1), (1, 1)]
            if input_format == 'cqt':
                rnn_input_size = bins_per_octave * num_octaves
            elif input_format == 'log':
                rnn_input_size = bins_per_octave * num_octaves - 2
            else:
                raise NotImplementedError

        self.conv = common.MaskConv(
            nn.Sequential(
                nn.Conv2d(1,
                          conv_channels,
                          kernel_size=cnn_kernel_sizes[0],
                          stride=cnn_strides[0],
                          padding=cnn_paddings[0]),
                nn.BatchNorm2d(conv_channels),
                nn.ReLU(),
                nn.Dropout(dropout),
                nn.Conv2d(conv_channels,
                          conv_channels,
                          kernel_size=cnn_kernel_sizes[1],
                          stride=cnn_strides[1],
                          padding=cnn_paddings[1]),
                nn.BatchNorm2d(conv_channels),
                nn.ReLU(),
                nn.Dropout(dropout),
            )) if batchnorm else common.MaskConv(
                nn.Sequential(
                    nn.Conv2d(1,
                              conv_channels,
                              kernel_size=cnn_kernel_sizes[0],
                              stride=cnn_strides[0],
                              padding=cnn_paddings[0]),
                    nn.ReLU(),
                    nn.Dropout(dropout),
                    nn.Conv2d(conv_channels,
                              conv_channels,
                              kernel_size=cnn_kernel_sizes[1],
                              stride=cnn_strides[1],
                              padding=cnn_paddings[1]),
                    nn.ReLU(),
                    nn.Dropout(dropout),
                ))

        # Based on above convolutions and spectrogram size using conv formula
        # (W - F + 2P)/ S+1
        rnn_input_size = int(
            math.floor(rnn_input_size - cnn_kernel_sizes[0][0] +
                       2 * cnn_paddings[0][0]) / cnn_strides[0][0] + 1)
        rnn_input_size = int(
            math.floor(rnn_input_size - cnn_kernel_sizes[1][0] +
                       2 * cnn_paddings[1][0]) / cnn_strides[1][0] + 1)
        rnn_input_size *= conv_channels
        rnn_input_size = rnn_input_size // self.frame_multiplier

        rnns = []
        rnn = BatchRNN(input_size=rnn_input_size,
                       hidden_size=hidden_size,
                       rnn_type=supported_rnns[rnn_type],
                       bidirectional=bidirectional,
                       batch_norm=False)
        rnns.append(('0', rnn))
        for x in range(hidden_layers - 1):
            rnn = BatchRNN(input_size=hidden_size,
                           hidden_size=hidden_size,
                           rnn_type=supported_rnns[rnn_type],
                           bidirectional=bidirectional,
                           batch_norm=batchnorm)
            rnns.append(('%d' % (x + 1), rnn))
        self.rnns = nn.Sequential(OrderedDict(rnns))
        self.lookahead = nn.Sequential(
            # consider adding batch norm?
            Lookahead(hidden_size, context=context),
            nn.Hardtanh(0, 20, inplace=True)) if not bidirectional else None

        fully_connected = nn.Sequential(
            nn.BatchNorm1d(hidden_size),
            nn.Dropout(dropout),
            nn.Linear(hidden_size, num_classes, bias=False),
        ) if batchnorm else nn.Sequential(
            nn.Dropout(dropout),
            nn.Linear(hidden_size, num_classes, bias=False),
        )
        self.fc = nn.Sequential(common.SequenceWise(fully_connected), )
        self.inference_softmax = common.InferenceBatchSoftmax()

    def forward(self, x, x_lengths):
        output_lengths = self.get_seq_lens(x_lengths)

        x = x.transpose(1, 2).contiguous()  # NxHxT
        x = x.unsqueeze(1)  # Add channel dimension NxCxHxT

        x, _ = self.conv(x, output_lengths)

        sizes = x.size()
        x = x.view(sizes[0], sizes[1] * sizes[2],
                   sizes[3])  # Collapse feature dimension
        x = x.transpose(1, 2).contiguous()  # NxTxH
        sizes = x.size()
        x = x.view(sizes[0], sizes[1] * self.frame_multiplier,
                   sizes[2] // self.frame_multiplier)  # Expand time dimension
        x = x.transpose(0, 1).contiguous()  # TxNxH
        output_lengths *= self.frame_multiplier

        for rnn in self.rnns:
            x = rnn(x, output_lengths)

        if self.lookahead:  # no need for lookahead layer in bidirectional
            x = self.lookahead(x)

        x = self.fc(x)
        x = x.transpose(0, 1)
        # identity in training mode, softmax in eval mode
        x = self.inference_softmax(x)
        return x, output_lengths

    def get_seq_lens(self, input_length):
        """
        Given a 1D Tensor or Variable containing integer sequence lengths, return a 1D tensor or
        variable containing the size sequences that will be output by the network.
        :param input_length: 1D Tensor
        :return: 1D Tensor scaled by model
        """
        seq_len = input_length
        for m in self.conv.modules():
            if type(m) == nn.modules.conv.Conv2d:
                seq_len = ((seq_len + 2 * m.padding[1] - m.dilation[1] *
                            (m.kernel_size[1] - 1) - 1) / m.stride[1] + 1)
        return seq_len.int()

    def transcribe(self, inputs, input_sizes, beam_size=1):
        logits, logit_sizes = self.forward(inputs, input_sizes)

        if beam_size > 1:
            raise NotImplementedError
        else:
            # Greedy decoder
            _, max_probs = torch.max(logits, 2)
            sequences = max_probs.view(max_probs.size(0), max_probs.size(1))

        transcripts = []
        for i, sequence in enumerate(sequences):
            seq_len = logit_sizes[i]
            string = []
            for j in range(seq_len):
                char = sequence[j].item()
                if char != 0 and len(string) > 0 and char == string[-1]:
                    continue
                string.append(char)
            # Clean up CTC blanks as they are meaningless once transcribed.
            string = [char for char in string if char != 0]
            transcripts.append(string)

        return transcripts

    @staticmethod
    def get_param_size(model):
        params = 0
        for p in model.parameters():
            tmp = 1
            for x in p.size():
                tmp *= x
            params += tmp
        return params
