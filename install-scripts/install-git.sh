#!/bin/bash
set -eux

sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git

mkdir -p ~/.scripts
wget -N -O ~/.scripts/git-prompt.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

wget -N -O ~/.scripts/git-completion.bash \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

git --version
