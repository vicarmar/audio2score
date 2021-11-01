import torch
import torch.nn as nn
import torch.nn.functional as F


class Extractor(nn.Module):
    def __init__(self, conv_channels, dropout=0.0, batchnorm=True):
        super(Extractor, self).__init__()

        kernel_size = 3
        cnn_strides = [2,2]
        cnn_paddings = [(1, 1), (1, 1)]

        layers = []
        layers.append(nn.Conv2d(
                    in_channels=1,
                    out_channels=conv_channels,
                    kernel_size=3, 
                    stride=2, 
                    padding='same'))
        if batchnorm:
            layers.append(nn.BatchNorm2d(conv_channels))
        layers.append(nn.ReLU())
        layers.append(nn.Dropout(dropout))

        layers.append(nn.Conv2d(
                    in_channels=1,
                    out_channels=conv_channels,
                    kernel_size=3,
                    stride=2,
                    padding='same'))
        if batchnorm:
            layers.append(nn.BatchNorm2d(conv_channels))
        layers.append(nn.ReLU())
        layers.append(nn.Dropout(dropout))
        

        self.conv = common.MaskConv(nn.Sequential(*layers))
        # TODO: Add 2-D attention blocks

    def 
        input_dim = int(
            math.floor(input_dim - cnn_kernel_sizes[0][0] +
                       2 * cnn_paddings[0][0]) / cnn_strides[0][0] + 1)
        rnn_input_size = int(
            math.floor(rnn_input_size - cnn_kernel_sizes[1][0] +
                       2 * cnn_paddings[1][0]) / cnn_strides[1][0] + 1)
        rnn_input_size *= conv_channels

    def forward(self, x, x_lengths):
        output_lengths = common.get_seq_lens(x_lengths)

        x = x.transpose(1, 2).contiguous()  # NxHxT
        x = x.unsqueeze(1)  # Add channel dimension NxCxHxT

        x, output_lengths = self.conv(x, output_lengths)

        return x, output_lengths


class SpeechTransformer(nn.Module):
    def __init__(self, model_conf, audio_conf, labels):
        super(SpeechTransformer, self).__init__()

        # model metadata needed for serialization/deserialization
        self.name = 'speechtransformer'
        self.version = '0.0.1'
        self.model_conf = model_conf
        self.audio_conf = audio_conf
        self.labels = labels

        d_model = self.model_conf.getint('d_model', 512)
        num_heads = self.model_conf.getint('num_heads', 8)
        num_encoder_layers = self.model_conf.get('num_encoder_layers', 6)
        num_decoder_layers = self.model_conf.get('num_decoder_layers', 6)
        dim_feedforward = self.model_conf.getint('dim_feedforward', 2048)
        dropout = self.model_conf.getfloat('dropout', 0.1)

        conv_channels = self.model_conf.getint('conv_channels', 8)
        batchnorm = self.model_conf.getboolean('batchnorm', True)

        # Read audio configuration
        input_format = self.audio_conf.get("input_format", 'log')
        bins_per_octave = self.audio_conf.getint("bins_per_octave")
        num_octaves = self.audio_conf.getint("num_octaves")

        num_classes = len(self.labels)


        if input_format == 'log':
            input_dim = bins_per_octave * num_octaves - 2
        else:
            raise NotImplementedError

        self.transformer = nn.Transformer(d_model=d_model,
                                          nhead=num_heads,
                                          num_encoder_layers=num_encoder_layers,
                                          num_decoder_layers=num_decoder_layers,
                                          dim_feedforward=dim_feedforward,
                                          dropout=dropout,
                                          layer_norm_eps=1e-05,
                                          batch_first=True,
                                          norm_first=False)

        self.extractor = nn.Extractor(conv_channels, dropout=dropout, batchnorm=True)
        # self.inference_softmax = InferenceBatchSoftmax()

        self.input_proj = nn.Linear(self.conv.get_output_dim(), d_model)
        self.input_dropout = nn.Dropout(p=dropout_p)
        self.positional_encoding = PositionalEncoding(d_model)


    def forward(self, x, x_lengths):

        conv_outputs, output_lengths = self.extractor(x, x_lengths)

        self_attn_mask = get_attn_pad_mask(conv_outputs, output_lengths, conv_outputs.size(1))

        outputs = self.input_proj(conv_outputs)
        outputs += self.positional_encoding(outputs.size(1))
        outputs = self.input_dropout(outputs)
        
        return x, output_lengths


    # def transcribe(self, inputs, input_sizes, beam_size=1):
    #     logits, logit_sizes = self.forward(inputs, input_sizes)

    #     if beam_size > 1:
    #         raise NotImplementedError
    #     else:
    #         # Greedy decoder
    #         _, max_probs = torch.max(logits, 2)
    #         sequences = max_probs.view(max_probs.size(0), max_probs.size(1))

    #     transcripts = []
    #     for i, sequence in enumerate(sequences):
    #         seq_len = logit_sizes[i]
    #         string = []
    #         for j in range(seq_len):
    #             char = sequence[j].item()
    #             if char != 0 and len(string) > 0 and char == string[-1]:
    #                 continue
    #             string.append(char)
    #         # Clean up CTC blanks as they are meaningless once transcribed.
    #         string = [char for char in string if char != 0]
    #         transcripts.append(string)

    #     return transcripts

    @staticmethod
    def get_param_size(model):
        params = 0
        for p in model.parameters():
            tmp = 1
            for x in p.size():
                tmp *= x
            params += tmp
        return params
