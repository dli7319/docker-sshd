FROM debian:buster

RUN apt update
RUN apt install -y openssh-server

RUN echo 'root:m_root_pwd' | chpasswd
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

RUN mkdir -p /var/run/sshd

RUN echo "Starting SSHD"
EXPOSE 22 22350-22360
CMD ["/usr/sbin/sshd", "-D"]
