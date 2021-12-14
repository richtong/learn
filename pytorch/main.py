#
# https://pytorch.org/tutorials/beginner/basics/quickstart_tutorial.html
# Quickstart

# import torch
# from torch import nn
from torch.utils.data import DataLoader  # type: ignore
from torchvision import datasets  # type: ignore
from torchvision.transforms import ToTensor, Lambda, Compose  # type: ignore
# import matplotlib.pyplot as plt  # type: ignore

training_data = datasets.FashionMNIST(
    root="data",
    train=True,
    download=True,
    transform=ToTensor(),
)

# setting train=False gets you the test data
test_data = datasets.FashionMNIST(
    root="data",
    train=False,
    download=True,
    transform=ToTensor(),
)

batch_size: int = 64

print(f"loading {training_data=} {test_data=}")
train_dataloader = DataLoader(training_data, batch_size=batch_size)
test_dataloader = DataLoader(test_data, batch_size=batch_size)

for X, y in test_dataloader:
    print(f"{X.shape=}")
    print(f"{y.shape=}, {y.dtype=}")

device = "cuda" if torch.cuda.is_available() else "cpu"
print(f"Using {device=}")

# 
class NeuralNetwork(nn.Module):
    def __init__(self):
