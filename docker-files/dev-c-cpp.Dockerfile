FROM ubuntu:16.10
ENV HOME /home/magnus

RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y software-properties-common && \
    apt-get install -y curl git htop man unzip vim wget sudo iputils-ping

RUN \
    apt-get install -y build-essential \
                       clang \
                       python

RUN \
    apt-get install -y openssh-server && \
    mkdir -p /var/run/sshd

RUN useradd -m -d ${HOME} --shell /bin/bash magnus
RUN adduser magnus sudo
RUN echo 'magnus:13ce28a75adf5321ef930660d55c13ce8f6eb788' | chpasswd

WORKDIR /home/magnus
ADD install-scripts ${HOME}/install-scripts

RUN \
    install-scripts/install-git.sh && \
    install-scripts/install-vim-plugins.sh

RUN \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf ${HOME}/install-scripts && \
  rm -f /etc/ssh/ssh_host_*

ADD .bashrc ${HOME}
add .bash_profile ${HOME}
ADD .vimrc ${HOME}
ADD .ssh/authorized_keys ${HOME}/.ssh/authorized_keys
ADD docker-files/sshd-entrypoint.sh /entrypoint.sh

RUN chown -R magnus:magnus ${HOME}

EXPOSE 22
ENTRYPOINT /entrypoint.sh
