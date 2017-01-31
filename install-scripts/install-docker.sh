#!/bin/bash
set -eux

apt-get install -y apt-transport-https \
                   ca-certificates

curl -fsSL https://yum.dockerproject.org/gpg | apt-key add -
add-apt-repository \
    "deb https://apt.dockerproject.org/repo/ \
    ubuntu-$(lsb_release -cs) \
    main"

apt-get update
apt-get -y install docker-engine
