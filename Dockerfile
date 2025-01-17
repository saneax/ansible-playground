FROM fedora

RUN dnf update -y && \
  dnf install -y python3 python3-dnf dnf dnf-plugins-core e2fsprogs openssh \
  openssh-server pwgen nmap-ncat net-tools curl wget vim git procps-ng systemd &&\
  sudo dnf clean all

RUN ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
#RUN mkdir /var/run/sshd

RUN echo 'root:12345678' | chpasswd
#RUN sudo chattr -ia /etc/ssh/sshd_config
RUN sed -i s/^#PasswordAuthentication\ yes/PasswordAuthentication\ no/ /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >>  /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed -E 's/session[[:space:]]+required[[:space:]]+pam_loginuid.so/session optional pam_loginuid.so/g' \
  -i /etc/pam.d/sshd
RUN ssh-keygen -A

# RUN mkdir /root/.ssh
copy id_rsa /root/.ssh/id_rsa
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/id_rsa
RUN chmod 400 /root/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]


