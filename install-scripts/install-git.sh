#!/bin/bash
set -eux

add-apt-repository -y ppa:git-core/ppa
apt-get update
apt-get install -y git

mkdir -p ~/.scripts
wget -O ~/.scripts/git-prompt.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

wget -O ~/.scripts/git-completion.bash \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

git --version
