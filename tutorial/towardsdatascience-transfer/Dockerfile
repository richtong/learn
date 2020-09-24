# https://www.dataquest.io/blog/docker-data-science/#
# Run Anaconda in a docker container
# from our own local fork that is a submodule in src/extern
#

# Note the above has typos in the command lines use
# https://hub.docker.com/r/continuumio/anaconda3/ instead
#
#
# Currently neither of these work with the conda installs below
# this is our fork of continuum
# FROM tongfamily/anaconda3
# This is the original continuum
#FROM continuumio/anaconda3
# Note that the passed in argument NAME is the name of the application
FROM tongfamily/tensorflow-notebook
LABEL maintainer="Rich Tong (rich@tongfamily.com)"
# jupyter notebook default port
EXPOSE 8888

# Use bash
#SHELL ["/bin/bash", "-c"]

RUN conda install -y \
        kaggle
# if conda doesnt have it use pip
# RUN pip install music21
