FROM hahlabs/ubuntu:dev
LABEL version.hahlabs-mysql="alpha-00.05.02"

COPY files/. files/
USER root
RUN  files/setup-mysql-user.sh \
     && service mysql restart \
     && mysql  < files/root-user.sql  \
     && cp files/startup.sh /home/hahlabs && chown hahlabs:hahlabs /home/hahlabs/startup.sh \
     && rm -rf files \
     && sed -Ei 's/#Port 22/Port 8022/' /etc/ssh/sshd_config
     
     
USER hahlabs

EXPOSE 3306 8022
# Enables the service on docker run container
ENTRYPOINT sudo ./startup.sh 