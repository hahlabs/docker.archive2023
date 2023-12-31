FROM ubuntu:22.04
LABEL version.mysql="8.2" \
      version.ubuntu="22.04-lts" \
      version.hahlabs-mysql="alpha-00.04.01"
# Update, Upgrade, install packages
RUN apt -y update \
   && apt -y upgrade \
   && apt install -y mysql-server sudo vim openssh-server
ENV TZ="America/Vancouver"
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Vancouver apt-get -y install tzdata && ln -fs /usr/share/zoneinfo/America/Vancouver /etc/localtime
# Setup ops user use defaults uid 15286 gid 15286
WORKDIR /home/hahlabs
COPY files/. files/
RUN files/setup-mysql-user.sh

#SSH Services
RUN mkdir /var/run/sshd
RUN echo 'root:HAH7A85@#!' | chpasswd
RUN sed -Ei 's/#(PermitRootLogin).+/\1 yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Adjust user root privileges, allow remote connections for root
RUN service mysql restart \
     && mysql  < files/root-user.sql  \
     && cp files/start-services.sh /home/hahlabs \
     && chown hahlabs:hahlabs /home/hahlabs/start-services.sh

RUN rm -rf files
USER hahlabs

EXPOSE 3306 22
# Enables the service on docker run container
ENTRYPOINT sudo ./start-services.sh && bash