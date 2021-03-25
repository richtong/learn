LearnOpenCV Tutorials
=====================

At some point, I need to commit to virtualenv or
[venv](http://cewing.github.io/training.python_web/html/presentations/venv_intro.html)
as a way to firewall off things. Or just use docker containers to do the same.

Basics
-----

See the `Makefile` for running the tutorial, the big ones are install which
loads any utilities and `download` which stuffs jpegs from imagenet into this
directory. Make sure you have `git lfs` set to track these image files so you
don't overload your github repo with junk.

Imagenetscraper broken
----------------------

Looks like licensing killed Imagenetscraper, it says no URL and in doing a
manual curl of it says the keyword synset not found and the API is not otherwise
documented, so it's important to find another way to get images

The problem are the copyright issues here I think.

Google Images as a source
-------------------------

[Google Images](https://www.pyimagesearch.com/2017/12/04/how-to-create-a-deep-learning-dataset-using-google-images/)
explains how to do this with a downloader

Google Open Images
-----------------

[Open Images](https://storage.googleapis.com/openimages/web/download.html) has
a set of cleared images too.
