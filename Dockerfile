FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y openssh-server pwgen netcat net-tools curl wget \
    vim && \
    apt-get clean all

RUN ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
RUN mkdir /var/run/sshd

RUN echo 'root:12345678' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' \
  /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session*required*pam_loginuid.so@session optional pam_loginuid.so@g' \
  -i /etc/pam.d/sshd

RUN mkdir /root/.ssh
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys

EXPOSE 22 
CMD ["/usr/sbin/sshd", "-D"]


