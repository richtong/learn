# Pytorch tutorials
#
# https://towardsdatascience.com/installing-pytorch-on-apple-m1-chip-with-gpu-acceleration-3351dc44d67c
# https://betterprogramming.pub/how-to-install-pytorch-on-apple-m1-series-512b3ad9bc6
# https://towardsdatascience.com/gpu-acceleration-comes-to-pytorch-on-m1-macs-195c399efcc1

# only works with 3.9 as of August 2022
PYTHON := 3.9
PYTHON_MINOR := $(PYTHON).12

PIP := torch torchvision torchaudio transformers datasets
MAIN := main.py

## install: install prerequisites and then install the
.PHONY: install
install: prerequisites install-env

## prerequisites: install the local packages
prerequisites:
	brew install rust

include ../../../../lib/include.jupyter.mk
include ../../../../lib/include.python.mk
include ../../../../lib/include.mk
