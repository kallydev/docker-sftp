FROM ubuntu:latest

RUN apt-get update && \
	apt-get install -y openssh-server

RUN mkdir /var/run/sshd

COPY config/sshd_config /etc/ssh/sshd_config

COPY run.sh /etc/sftp/run.sh

EXPOSE 22

ENTRYPOINT ["/bin/bash", "/etc/sftp/run.sh"]
