# ################################################################
#
#
#  Prior work
#  ==========
#   export PLAY_HASKELL_GIT_NAME="yanqirenshi"
#   export PLAY_HASKELL_GIT_EMAIL="yanqirenshi@gmail.com"
#
#  Build
#  =====
#   docker build -t play.haskell .
#
#  Run
#  ===
#   docker run -v ~/.ssh:/home/h/.ssh -env PLAY_HASKELL_GIT_NAME={} -env PLAY_HASKELL_GIT_EMAIL={} -it play.haskell /bin/bash
#
#  Start
#  ===
#   sh /home/h/tmp/setup.sh
#
# ################################################################

FROM debian:buster

MAINTAINER Renshi <yanqirenshi@gmail.com>

#####
##### Install Packages
#####
USER root

RUN apt update
RUN apt install -y build-essential
RUN apt install -y curl
RUN apt install -y haskell-platform
RUN apt install -y emacs
RUN apt install -y nginx


#####
##### Install Haskell
#####
USER root

RUN curl -sSL https://get.haskellstack.org/ | sh
RUN stack setup


#####
##### Make Group / User
#####
USER root

RUN groupadd h-users
RUN useradd -d /home/h -m -g h-users h


#####
##### Make User's Directory
#####
USER h
WORKDIR /home/h

RUN mkdir /home/h/prj
RUN mkdir /home/h/tmp
RUN mkdir -p /home/h/.emacs.d/dist


#####
##### Setting Haskell
#####
USER h
WORKDIR /home/h

RUN echo '' > /home/h/.bashrc
RUN echo 'export PATH="$HOME/.local/bin:$PATH"' > /home/h/.bashrc


#####
##### Setting Emacs
#####
USER h
WORKDIR /home/h/.emacs.d/dist

RUN git clone https://github.com/yanqirenshi/emacs.git

RUN touch /home/h/.emacs.d/init.el
RUN echo '(load "~/.emacs.d/dist/emacs/init-base.el")'  >> /home/h/.emacs.d/init.el

RUN emacs --script /home/h/.emacs.d/dist/emacs/src/package.el


#####
##### Start
#####
USER h
WORKDIR /home/h

COPY setup.sh /home/h/tmp/
