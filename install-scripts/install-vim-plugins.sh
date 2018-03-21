#!/bin/bash
set -eux

git clone https://github.com/tpope/vim-pathogen.git ~/.vim

mkdir ~/.vim/plugin
pushd ~/.vim/plugin
wget "https://raw.githubusercontent.com/bogado/file-line/master/plugin/file_line.vim"
popd

mkdir ~/.vim/bundle
pushd ~/.vim/bundle

git clone git://github.com/altercation/vim-colors-solarized.git
git clone git://github.com/airblade/vim-gitgutter.git
git clone https://github.com/fatih/vim-go.git

apt-get install -y cmake \
                   python-dev \
                   python3-dev \
                   build-essential
git clone https://github.com/Valloric/YouCompleteMe.git
pushd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
