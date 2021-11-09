import math
import traceback

import torch
import torch.nn as nn
from audio2score.models.common import (InferenceBatchSoftmax, MaskConv,
                                       SequenceWise)
from audio2score.utils import IGNORE_ID, config_logger


class Extractor(nn.Module):
    def __init__(self, input_dim, conv_channels, dropout=0.0, batchnorm=True):
        super(Extractor, self).__init__()

        self.input_dim = input_dim
        self.conv_channels = conv_channels

        self.kernel_size = (3, 3)
        self.stride = (2, 2)
        self.padding = (1, 1)

        layers = []
        layers.append(nn.Conv2d(
            in_channels=1,
            out_channels=self.conv_channels,
            kernel_size=self.kernel_size,
            stride=self.stride,
            padding=self.padding))
        if batchnorm:
            layers.append(nn.BatchNorm2d(self.conv_channels))
        layers.append(nn.ReLU())
        layers.append(nn.Dropout(dropout))

        layers.append(nn.Conv2d(
            in_channels=self.conv_channels,
            out_channels=self.conv_channels,
            kernel_size=self.kernel_size,
            stride=self.stride,
            padding=self.padding))
        if batchnorm:
            layers.append(nn.BatchNorm2d(self.conv_channels))
        layers.append(nn.ReLU())
        layers.append(nn.Dropout(dropout))

        self.conv = MaskConv(nn.Sequential(*layers))
        # TODO: Add 2-D attention blocks

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

    def get_output_dim(self):
        dim = self.input_dim
        for m in self.conv.modules():
            if type(m) == nn.modules.conv.Conv2d:
                dim = math.floor((dim + 2 * m.padding[0] - m.dilation[0] *
                                  (m.kernel_size[0] - 1) - 1) / m.stride[0] + 1)
        dim *= self.conv_channels
        return dim

    def forward(self, x, x_lengths):
        # x=BxTxD (spectrograms)
        output_lengths = self.get_seq_lens(x_lengths)

        x = x.transpose(1, 2).contiguous()  # BxDxT
        x = x.unsqueeze(1)  # Add channel dimension BxCxDxT

        x, output_lengths = self.conv(x, output_lengths)  # BxChxD_outxT_out

        sizes = x.size()
        x = x.view(sizes[0], sizes[1] * sizes[2],
                   sizes[3])  # Collapse feature dimension
        x = x.transpose(1, 2).contiguous()  # BxTxD

        return x, output_lengths


class PositionalEncoding(nn.Module):
    """Add positional information, using sine and cosine functions of different frequencies
        It includes final dropout layer
    """

    def __init__(self, d_model, dropout=0.1, max_len=5000):
        """Add positional information, using sine and cosine functions of different frequencies.
            PE(pos, 2i) = sin(pos/10000^(2i/d_model))
            PE(pos, 2i+1) = cos(pos/10000^(2i/d_model))
                where pos is the word position and i is the embed idx

        Args:
            d_model (int): Dim of embedding.
            dropout (float, optional): Dropout factor. Defaults to 0.1.
            max_len (int, optional): Max length of incoming sequence. Defaults to 5000.
        """
        super(PositionalEncoding, self).__init__()
        self.dropout = nn.Dropout(p=dropout)

        pe = torch.zeros(max_len, d_model)
        position = torch.arange(0, max_len, dtype=torch.float).unsqueeze(1)
        div_term = torch.exp(torch.arange(0, d_model, 2).float() * (-math.log(10000.0) / d_model))
        pe[:, 0::2] = torch.sin(position * div_term)
        pe[:, 1::2] = torch.cos(position * div_term)
        pe = pe.unsqueeze(0).transpose(0, 1)
        self.register_buffer('pe', pe)

    def forward(self, x):
        """Forward pass of Positional Encoder.

        Args:
            x (tensor): input sequence batch (TxBxD).

        Returns:
            (tensor): output sequence batch (TxBxD).
        """
        x = x + self.pe[:x.size(0), :]
        return self.dropout(x)


class SpeechTransformer(nn.Module):
    def __init__(self, model_conf, audio_conf, labels):
        super(SpeechTransformer, self).__init__()

        # model metadata needed for serialization/deserialization
        self.name = 'speechtransformer'
        self.version = '0.0.1'
        self.model_conf = model_conf
        self.audio_conf = audio_conf
        self.labels = labels

        self.logger = config_logger('speechtranformer', console_level='DEBUG', file_level='DEBUG')

        d_model = self.model_conf.getint('d_model', 512)
        num_heads = self.model_conf.getint('num_heads', 8)
        num_encoder_layers = self.model_conf.getint('num_encoder_layers', 6)
        num_decoder_layers = self.model_conf.getint('num_decoder_layers', 6)
        dim_feedforward = self.model_conf.getint('dim_feedforward', 2048)
        dropout = self.model_conf.getfloat('dropout', 0.1)

        conv_channels = self.model_conf.getint('conv_channels', 8)
        batchnorm = self.model_conf.getboolean('batchnorm', True)

        # Read audio configuration
        input_format = self.audio_conf.get("input_format", 'log')
        bins_per_octave = self.audio_conf.getint("bins_per_octave")
        num_octaves = self.audio_conf.getint("num_octaves")

        num_classes = len(self.labels)
        self.sos_id = self.labels.index('<sos>')
        self.eos_id = self.labels.index('<eos>')

        if input_format == 'log':
            input_dim = bins_per_octave * num_octaves - 2
        else:
            raise NotImplementedError

        # Modules:
        self.extractor = Extractor(input_dim,
                                   conv_channels,
                                   dropout=dropout,
                                   batchnorm=batchnorm)
        # Source processing: Convert from extractor output dim to d_model
        self.enc_input_proj = nn.Linear(self.extractor.get_output_dim(), d_model)
        self.enc_positional_encoding = PositionalEncoding(d_model, dropout)

        self.transformer = nn.Transformer(
            d_model=d_model,
            nhead=num_heads,
            num_encoder_layers=num_encoder_layers,
            num_decoder_layers=num_decoder_layers,
            dim_feedforward=dim_feedforward,
            dropout=dropout)

        # Target processing:
        # Embedding for each of the possible classes, with d_model vector length.
        self.dec_embedding = nn.Embedding(num_classes, d_model, padding_idx=0)
        self.sqrt_dim = math.sqrt(d_model)
        self.dec_positional_encoding = PositionalEncoding(d_model, dropout)

        fully_connected = nn.Sequential(
            nn.LayerNorm(d_model),
            nn.Linear(d_model, num_classes, bias=False)
        )

        self.fc = nn.Sequential(SequenceWise(fully_connected), )

        self.inference_softmax = InferenceBatchSoftmax()

    def encode_inputs(self, x, x_lengths):
        # Extraction from spectrograms x=BxTxD.
        x, x_lengths = self.extractor(x, x_lengths)  # NxTxD

        # Input processing:
        src_pad_mask = self.get_pad_mask(x, x_lengths)  # BxT

        x = self.enc_input_proj(x)  # BxTxd_model
        x = self.enc_positional_encoding(x)
        # Transformer encoder needs shape TxBxd_model
        x = x.transpose(0, 1).contiguous()  # TxBxd_model

        return x, src_pad_mask

    def encode_targets(self, tgt, tgt_lengths):
        # Target processing: tgt=BxT'
        # Add SOS and EOS to target:
        tgt_in, tgt_out, tgt_out_lengths = self.process_tgt(tgt, tgt_lengths)

        # Create masks:
        tgt_pad_mask = self.get_pad_mask(tgt_in, tgt_out_lengths)  # BxT'
        tgt_subsequent_mask = self.transformer.generate_square_subsequent_mask(
            tgt_in.shape[1]).to(tgt_in.device)  # T'xT'

        tgt_in = self.dec_embedding(tgt_in) * self.sqrt_dim  # BxT'xd_model
        tgt_in = self.dec_positional_encoding(tgt_in)
        # Transformer decoder needs a shape (T'xBxd_model)
        tgt_in = tgt_in.transpose(0, 1).contiguous()

        return tgt_in, tgt_out, tgt_out_lengths, tgt_pad_mask, tgt_subsequent_mask

    def encode(self, x, x_lengths):
        try:
            x, src_pad_mask = self.encode_inputs(x, x_lengths)
            memory = self.transformer.encoder(
                src=x, mask=None, src_key_padding_mask=src_pad_mask)  # TxBxd_model
        except Exception as error:
            self.logger.error("SpeechTranformer encode error")
            self.logger.error(traceback.format_exc())
            raise error
        return memory, src_pad_mask

    def decode(self, memory, src_pad_mask, tgt, tgt_lengths):
        try:
            tgt_in, tgt_out, tgt_out_lengths, tgt_pad_mask, tgt_subsequent_mask = \
                self.encode_targets(tgt, tgt_lengths)
            output = self.transformer.decoder(tgt=tgt_in,
                                              memory=memory,
                                              tgt_mask=tgt_subsequent_mask,
                                              memory_mask=None,
                                              tgt_key_padding_mask=tgt_pad_mask,
                                              memory_key_padding_mask=src_pad_mask)  # ToxBxd_model
            output = self.fc(output)  # To x B x num_classes
            output = output.transpose(0, 1)   # B x To x num_classes
            # identity in training mode, softmax in eval mode
            output = self.inference_softmax(output)
        except Exception as error:
            self.logger.error("SpeechTranformer decode error")
            self.logger.error(traceback.format_exc())   
            raise error
        return output, tgt_out, tgt_out_lengths

    def forward(self, x, x_lengths, tgt, tgt_lengths):
        memory, src_pad_mask = self.encode(x, x_lengths)
        output, tgt_out, tgt_out_lengths = self.decode(memory, src_pad_mask, tgt, tgt_lengths)

        return output, tgt_out, tgt_out_lengths

    def get_pad_mask(self, x, x_lengths):
        mask = torch.BoolTensor(x.size()[:2]).fill_(False)
        if x.is_cuda:
            mask = mask.cuda()
        for i, length in enumerate(x_lengths):
            length = length.item()
            if (mask[i].size(-1) - length) > 0:
                mask[i].narrow(-1, length, mask[i].size(-1) - length).fill_(True)
        return mask

    def process_tgt(self, tgt, tgt_lengths):
        y = tgt.clone()
        y[y == IGNORE_ID] = self.eos_id

        sos = y.new([self.sos_id] * y.shape[0])
        y_in = torch.cat([sos.unsqueeze(1), y], dim=-1)
        eos = y.new([self.eos_id] * y.shape[0])
        y_out = torch.cat([y, eos.unsqueeze(1)], dim=-1)

        y_out_lengths = tgt_lengths + 1
        mask = self.get_pad_mask(y_out, y_out_lengths)
        y_out = y_out.masked_fill(mask, IGNORE_ID)

        assert y_in.size() == y_out.size()
        return y_in, y_out, y_out_lengths

    def transcribe(self, inputs, input_sizes, beam_size=1):
        batch_size = inputs.shape[0]
        max_len = inputs.shape[1]
        # Encode inputs
        memory, src_pad_mask = self.encode(inputs, input_sizes)

        if beam_size > 1:
            raise NotImplementedError
        else:
            # Greedy decoder
            tgt = torch.empty((batch_size, 0), dtype=torch.int32)
            tgt_lengths = torch.zeros((batch_size, 1), dtype=torch.int32)
            for i in range(max_len):
                output, tgt_out, tgt_lengths = self.decode(memory, src_pad_mask, tgt, tgt_lengths)
                _, next_word = torch.max(output, dim=2)
                next_word = next_word.data[:, -1]
                tgt = torch.cat([tgt, next_word.unsqueeze(1)], dim=1)

            return tgt.tolist()

    @staticmethod
    def get_param_size(model):
        params = 0
        for p in model.parameters():
            tmp = 1
            for x in p.size():
                tmp *= x
            params += tmp
        return params
