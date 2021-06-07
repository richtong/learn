Tutorials taken from across the web
===================================

Learnopencv - Transfer learning
-----------------

[Keras Tutorial](https://www.learnopencv.com/keras-tutorial-transfer-learning-using-pre-trained-models/)
explains how to take Keras and Imagenet and do transfer learning. This is an
exact tutorial following that lesson plan.

But the problem is that their extraction of data from imagenet does not work.
The utility doesn't seem to extract anymore.

Towrds Data Science - Transfer Learning
----------------------------------------

This doesn't use the Imagenet trick, so followit. Thi is from the book _Hands
on Transfer Learning with Python_ See Andrew Ng explain it in the [NIPS 2016
tutorial](https://www.youtube.com/watch?v=wjqaz6m42wU) and see the [slides](https://media.nips.cc/Conferences/2016/Slides/6203-Slides.pdf)

The first idea is to use the pretrained weights and keep the early layers
frozen, you basically just replace the final fully connect layers which do the
classification. And the earlier layers basically give you a big vector that
parameterizes images. You freeze when you don't have much labelled data for the
next task.

Then there is fine tuning, where you allow some of the later stages to be. So
let's do the first ase study which is image classification where we just want to
do dogs and cats. See Francois Chollet's book [Deep Learning with
Python](https://www.manning.com/books/deep-learning-with-python)

You can look at the github of answer in but
[Quora](https://www.quora.com/Can-I-run-Jupyter-notebooks-from-the-browser-directly-off-GitHub)
explains that you can use [GKE](https://gke.mybinder.org) and point it to a github
repo. It will start a docker container and run the notebook in the cloud!

The data comes from [Kaggle](https://www.kaggle.com/c/dogs-vs-cats/data)
trained. And we download 1GB of dog and cats from there. Make sure you have
`git lfs track ".jpg` enabled in this repo

Downloading Kaggle data
-----------------------

The have a nice api at [kaggle](https://github.com/Kaggle/kaggle-api) that you
can install with `pip install kaggle`.

If you do this then you want to make sure to add this to your requirements.txt
or see the other methods below

The confusing world of python isolation
---------------------------------------

There are so many ways to deal with python

No isolation
-------------

Whenever you see a new package just run `pip install _package` and it will load
into your user environment. As an aside, you shouldn't do `sudo pip install` as
this installs things as a super user. Theoretically for all users but with many
permission problems. But the base things are to do a
`brew install python` and then pip install

Requirements.txt (the quick and dirty)
----------------

Now this is going to lead to lot and lots of packages and no way on a new
install to do anything but install everything, so the simplest thing is to get
a list of packages installed with `pip freeze > requirements.txt` in each
directory where you have python and then on a new machine do a `pip install -r
requiremetns.txt` See [User Guide](https://pip.pypa.io/en/stable/user_guide/).
The advantage here is that you will get reproducibility by pinning all versions
at the time you created it.

But, if there are conflicts, then you will still have problems so all
installations need to work. Also for larger installations you can end up with
circular dependency problems across the 150K modules in PyPi.

Using Python 3 Venv
-------------------

The new `python -m venv` creates a containerized environment for python
programs. We use it in these tutorials to prevent collisions and make things
repeatable. So for each site, we have a venv sub-directory

To run in an environment [venv](https://docs.python.org/3/library/venv.html) explains
you create one with. Also note that you don't want to check in the venv as it
can contain gigabytes of files, instead instantiate it with requirements.txt

```bash
cd datascience
# snapshot the environment and then comment out lines that don't matter
pip freeze > requirements.txt
# this is important you don't want to check it all in so make ignore it
cat >> .gitignore <<<"venv"
# note we call the environment venv for simplicity
# This adds about 12MB to the repo fyi
python -m venv venv
source ./container/bin/activate
# now install what you need
pip install -r requirements.txt
# document what you did
pip freeze > requirements.txt
# work away and then save it all
git push
# when you are done
deactivate
```

At this point, you can do a series of pip installs and then you don't need
requirements.txt at all, you can just put the whole thing in github. At this
point, `pip freeze > requirements.txt` is more like documentation.

Different versions of python with conda and docker (when the quick and dirty breaks)
--------------------------------------------------

At this point, the next problem is different versions of python, you can solve
this by installing Conda and then using it to manage things, but you still need
to have a stable set of system utilities.

Also conda uses a better requirements testing, but only works across 1,500 or so
packages, so you use conda for those and then pip for the rest.

If you are at this level of isolation, you might as well use Docker, because
then you will be operating system and system library independent as well. Since
brew works so well with Macs, it probably doesn't make sense to have conda
manage python at the system level while brew does the rest.

To do this, you should have a Dockerfile and a Makefile that encapsulates
things. That is what is done here. There is scaffolding in
`src/lib/include.python.mk` which gives you the base commands.

You should also fork the dockers files you do you use and put those in
submodules in `src/extern` because then you will have complete reproducibility.

Creating Docker images and directory naming
-------------------------------------------

By default we have a Makefile and uses the standard src/lib/include.python.mk
file so that you can create installations directliy with `make requirements` and
you can use venv to do this with `make venv` finally, you can also create
a docker image as well with `make docker`

Making sure venv is in .dockerignore
------------------------------------

[Docker](https://forums.docker.com/t/docker-build-ignoring-dockerignore/11991) explains
how to ignore files like venv which is does not need to be copied into the
docker build space
