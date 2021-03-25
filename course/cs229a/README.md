homework for CS229

Note we do not include the token.mat for security reasons. It has the token for
submitting homework

These require that you install octave into the host system with, this is handled
by the install.sh right now in ~rich/bin/install.sh

```
brew cask install octave
```

For an operating system independent installation, you can use an Octave docker
container that is running a vnc server so that it can display plots and things.
See [octave](https://github.com/compdatasci/octave-desktop)

```bash
../../infra/install.sh
# this will install the docker and the whole environment
docker pull compdatasci/octave-desktop
```

While you can use manually docker, there is a helper function in
compdatasci/octave-desktop which is a submodules in `src/external`
[octave
desktop](https://github.com/compdatasci/octave-desktop/blob/master/octave_desktop.py)
is
the location of the script that builds the docker command. I cloned the one
command file and you can use it with:

```bash
./octave_project.py -v "$(pwd)" # this sets the files to be the CWD
```

If you want to use your image cloned from compdatasci, then you use the tag

```bash
./octave_project.py -i richt/octave-desktop -v "$(pwd)"
# this sets the files to be the CWD
./octave
```
