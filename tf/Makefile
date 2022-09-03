# Tensorflow on Apple Silicon tutorials
#
MAIN := main.py

# If you do not want to use conda, then install these packages
# https://medium.com/mlearning-ai/install-tensorflow-on-mac-m1-m2-with-gpu-support-c404c6cfb580
#ENV := conda
#conda -c apple tensorflow-deps
# See https://anaconda.org/apple/tensorflow-deps/files
# Unpack the latest zip file and look in meta.yaml
# https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html
# I don't know how tight these really are probably just the >= is needed
#PIP += "grpcio>=1.37.0,<2.0" \
#       "h5py>=3.6.0,<3.7" \
#       "numpy>=1.22.3,<1.23.0"

PIP += "grpcio>=1.37.0" \
	   "h5py>=3.6.0" \
	   "numpy>=1.22.3"

# base tensorflow
PIP += tensorflow-macos tensorflow-metal

include ../../../../lib/include.jupyter.mk
include ../../../../lib/include.python.mk
include ../../../../lib/include.mk
