#
## Makefile for LearnOpenCV Tutorials
#
# Note that using a double hash will print things out when you do a make help
#

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html does not
# work because we use an include file
# https://swcarpentry.github.io/make-novice/08-self-doc/ is simpler just need ##
# and it dumpes them out relies on the variable MAKEFILE_LIST which is a list of
# all files note we do not just use $< because this is an include.mk file
help: $(MAKEFILE_LIST)
	@sed -n 's/^##//p' $(MAKEFILE_LIST)

## install: utilities needed
install:
	pip install imagenetscraper

## download sample files note as of June 2019 some of these sets are not online
# http://image-net.org/api/text/imagenet.synset.geturls?wnid=n07734017
imagenetscraper:
	imagenetscraper n07734017 tomato
	imagenetscraper n07756951 watermelon
	imagenetscraper n07735510 pumpkin
