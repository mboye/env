#!/bin/bash
set -eux

git clone https://github.com/tpope/vim-pathogen.git ~/.vim

mkdir ~/.vim/bundle
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git
