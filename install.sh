#!/bin/sh
BASEDIR=$(dirname $(readlink -f "$0"))
set -x
ln -s ${BASEDIR}/.vim ~/.vim
ln -s ${BASEDIR}/.vimrc ~/.vimrc
ln -s ${BASEDIR}/.tmux.conf ~/.tmux.conf
ln -s ${BASEDIR}/.zshrc ~/.zshrc
ln -s ${BASEDIR}/.gitconfig ~/.gitconfig
