FROM ubuntu:14.04
ENV TERM xterm-256

RUN apt-get update \
&& apt-get install -y curl \
&& curl -sL https://deb.nodesource.com/setup | sudo bash - \
&& apt-get install -y nodejs \
&& apt-get install -y build-essential \
&& apt-get install -y openssh-server \ 
&& npm install -g bower \
&& apt-get install -y rsync \
&& apt-get install -y git-core

RUN adduser --disabled-password --gecos '' docker \
 && adduser docker sudo \
 && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir -p /home/docker/.ssh && mkdir -p /var/run/sshd
COPY docker_key.pub /home/docker/.ssh/authorized_keys
USER docker
RUN mkdir /home/docker/app
WORKDIR /home/docker/app
CMD sudo /usr/sbin/sshd -D

