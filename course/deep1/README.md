# Deeplearning.ai Course 1 Neural Networks

The best instructions are on the Coursera site itself
[course](https://www.coursera.org/learn/neural-networks-deep-learning/discussions/all/threads/29j3DW9WEeiqiRKZ5Tzn-A/replies/jvhgGG9XEeie7g7c09Nfsg?sort=createdAtAsc&page=1)
but hard hard to find.

This uses a web-based Jupyter notebook, but instead of using that, we will use a
dockerized Jupyter notebook with iPython and numpy loaded.

There are four ways to run this with open items, but only two seem to work righ
now:

1. Use `brew install jupyter` to just get that installation and run `jupyter
   notebook`. Note that this default installation does not inlcude all the
   libraries, this is not complicated, you just need to `brew install` or `pip
   install` into the system python and jupyter picks it up.
1. Take the copied homework and use it with a local python. On a Mac, this is as
   simple as `brew install python numpy` and you are more or less ready to go by
   running from the directory you will also need other utilities in particular you
   also need `matplotlib h5py scipy PIL`, but you don't see the actual notebook
   information. But this is good for simple REPL debugging

Here are the backup ways to do this:

1. Use `brew install anaconda` which installs the /Applications/Anaconda
   Navigator and from there you can start Jupyter notebook and navigate to the
   omework. When if comes time to submit your work, the `Submit Assignment` doesn't
   seem to get copied in the tar format, so you do have to manually copy your
   assignment code (which isn't bad, the code is short) over to the Coursera
   notebook and hit submit assignment, this generates the JSON that the grader uses
   in the next submission. The submission occurs after the notebook is done. When
   if comes time to submit your work, the `Submit Assignment` doesn't seem to get
   copied in the tar format, so you do have to manually copy your assignment code
   (which isn't bad, the code is short) over to the Coursera notebook and hit
   submit assignment, this generates the JSON that the grader uses in the next
   submission and this runs the grader automatically.
1. Use the host-based thing at Cloudera, the problems are that you can't do this
   offline and if you end your subscription you lose your files. Also this does
   not work on an iPhone for example.

There other methods have issues

1. Use the docker image in src/container/jupyter this means that you have to
   fiddle with the location of /var/data in the container, you can either have a
   shell script, assuming that it all done, you should be able to do a `make run`
   and it will work.
1. Use the docker image in src/container/anaconda but this current has a bug in
   it for startup of jupyter.

## Copying all the notebooks - Manual

You should insert this cell at the very top for courses 1-3 and then SHIFT-enter
to run it, this should create a giant tarball. This works for Course 1, 2 and 5.
Course 3 has no notebooks and Course 4 uses a different structure.

```
"""
the following commands record the environment dependencies
for the course, and packages all course assignments and
their associated data into an archive.  the results are
deposited in the "course home" directory two directories
up from where they can be downloaded/copied to your local
machine
"""

# save the environment dependencies
!conda list --explicit > ../../coursera-deeplearning-ai-course1-condaenv.txt
# package all notebook content
!tar chzvf ../../coursera-deeplearning-ai-course1.tgz ../../* --exclude ../../coursera-deeplearning-ai-course1.tgz
```

This will generate some spurious error messagea and then you choose file open
and go all the way up to the root and you will see the .tgz file. click on it
and it will download.

## You can "cheat"

As quite a few git repos are up with the answers, don't recommend this, you
don't learn anything, but if there

## Copying all content including videos with cloudera-dl

[Cousera-dl](https://github.com/coursera-dl/coursera-dl) is a general purpose downloader.

The steps are:

1. Figure out the name of the course which is buried in the URL

`https://www.cloudera.org/learn/<CLASS_NAME>/home/welcome`

1. Then run the docker container

```bash
docker run --rm -it -v "$(pwd):/course" courseradl/courseadl -u <USER> -p \
<PASSWORD>  <CLASS_NAME1> <CLASS_NAME2> ...
```
