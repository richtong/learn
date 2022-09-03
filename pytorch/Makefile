# Pytorch tutorials
#
PIP := torch torchvision torchaudio transformers datasets jupyter jupyterlab
MAIN := main.py

## install: install prerequisites and then install the
.PHONY: install
install: prerequisites install-jupyter install-env

## prerequisites: install the local packages
prerequisites:
	brew install rust

include ../../../../lib/include.jupyter.mk
include ../../../../lib/include.python.mk
include ../../../../lib/include.mk
