Courses for Rich
================

Storage of courses that Rich has taken which has the data for the courses. The
actual image that runs it is done in `docker/images`

Use of Git LFS
--------------
There are large files in here. This assumes that we are putting into git lfs.
Note that we track txt files because they are used in speech processing.

```
git lfs track "*.mp4" "*.npy" "*.txt"
```

Courses taken
-------------
cs229. Really this is CS229A from Coursera
deep?. The deeplearning.ai specialization on machine learning

Python and other requirements
-----------------------------
The main directory has a `requirements.txt` for python, this was done with
Python 3.7, so in a new installation, load it up with `pip install -r
requirements.txt` to get a reproducible build.

If you are really have problems, then you can do a use `./jupyter.sh` which runs
a tongfamily/coursera-notebook container that has all of these build maintained

## How does the runtime environment work
There is a docker container with all the right modules loaded, the configuration
of this container is in `src/docker/images/tensorflow-notebook`. So go there and
do a `make` and then `make push` to get the container into dockerhub.

Then the `jupyter.sh` is really a docker run of that container that points it to
the correct local directory.

To use for other containers, the process is:

1. Go to the `src/docker/images` and copy into a fresh directory the images that
   is most like it
2. Then edit the Dockerfile so that you get the modules that you want. The
   advantage is that this is isolated from the host operating system
3. Make and push that container. The system uses the directory name as the
   docker image name, so name it well ;-)
3. Then copy this directory and put the relevant data into it Then
modify the jupyter.sh to what you like and refer to that docker name
