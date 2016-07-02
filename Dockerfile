FROM ubuntu:14.04
ENV TERM xterm-256

RUN apt-get update \
&& apt-get install -y nodejs npm \
&& apt-get install -y openssh-server \ 
&& npm install -g bower 

RUN mkdir -p /root/.ssh && mkdir -p /var/run/sshd
COPY docker_key.pub /root/.ssh/authorized_keys
WORKDIR /app
CMD /usr/sbin/sshd -D

