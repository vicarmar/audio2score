import torch
from audio2score.utils import IGNORE_ID


class Loss(object):
    """A simple wrapper class for loss calculation"""

    def __init__(self, model, device):
        self.model = model
        self.device = device
        self.criterion = torch.nn.CrossEntropyLoss(
            ignore_index=IGNORE_ID, reduction='mean').to(self.device)

    def calculate_loss(self, inputs, input_sizes, targets, target_sizes):
        """Calculate CrossEntropy loss.
        Args:
            logits: N x T x C, score before softmax
            logits_sizes: number of timesteps of logits
            targets: N x T
            target_sizes: number of timesteps of targets
        """
        inputs = inputs.to(self.device)
        input_sizes = input_sizes.to(self.device)
        targets = targets.to(self.device)
        target_sizes = target_sizes.to(self.device)

        logits, tgt_true, logit_sizes = self.model(inputs, input_sizes, targets, target_sizes)

        out = logits.contiguous().view(-1, logits.size(-1))  # 2D -> BxTo x num_classes
        tgt_true = tgt_true.contiguous().view(-1)  # 1D -> B*To

        out = out.float()  # ensure float32 for loss
        tgt_true = tgt_true.long()
        loss = self.criterion(out, tgt_true)

        if loss.item() == float("inf") or loss.item() == float("-inf"):
            raise Exception("WARNING: received an inf loss")
        if torch.isnan(loss).sum() > 0:
            raise Exception('WARNING: received a nan loss')
        if loss.item() < 0:
            raise Exception("WARNING: received a negative loss")
        return loss
