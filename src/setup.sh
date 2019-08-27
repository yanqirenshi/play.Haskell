#!/bin/sh

git config --global user.name  $PLAY_HASKELL_GIT_NAME
git config --global user.email $PLAY_HASKELL_GIT_EMAIL

cd ~/prj
git clone git@github.com:yanqirenshi/play.Haskell.git
