FROM debian:buster

RUN apt-get update && apt-get install -y openssh-server rsync

RUN echo 'root:m_root_pwd' | chpasswd
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'GatewayPorts clientspecified' >> /etc/ssh/sshd_config

RUN mkdir -p /var/run/sshd

RUN echo "Starting SSHD"
EXPOSE 22 22350
CMD ["/usr/sbin/sshd", "-D"]
