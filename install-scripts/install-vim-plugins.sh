#!/bin/bash
set -eux

git clone https://github.com/tpope/vim-pathogen.git ~/.vim

mkdir ~/.vim/bundle
cd ~/.vim/bundle

git clone git://github.com/altercation/vim-colors-solarized.git
git clone git://github.com/airblade/vim-gitgutter.git

apt-get install -y cmake \
                   python-dev \
                   python3-dev
git clone https://github.com/Valloric/YouCompleteMe.git
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
