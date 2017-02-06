FROM ubuntu:16.10
ENV HOME /home/magnus
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y software-properties-common && \
    apt-get install -y tmux curl git htop man unzip vim wget sudo iputils-ping

RUN \
    apt-get update && \
    apt-get install -y build-essential \
                       clang \
                       gdb \
                       lcov \
                       python

RUN \
    apt-get update && \
    apt-get install -y openssh-server && \
    mkdir -p /var/run/sshd

RUN useradd -m -d ${HOME} --shell /bin/bash magnus
RUN adduser magnus sudo
RUN echo 'magnus:magnus' | chpasswd
RUN locale-gen en_US.UTF-8

WORKDIR /home/magnus
ADD install-scripts ${HOME}/install-scripts

RUN \
    install-scripts/install-git.sh && \
    install-scripts/install-vim-plugins.sh

RUN \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf ${HOME}/install-scripts && \
  rm -f /etc/ssh/ssh_host_*

ADD home ${HOME}
ADD docker-files/sshd-entrypoint.sh /entrypoint.sh

RUN chown -R magnus:magnus ${HOME}

EXPOSE 22
ENTRYPOINT /entrypoint.sh
