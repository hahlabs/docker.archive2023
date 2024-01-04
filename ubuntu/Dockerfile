FROM ubuntu:22.04
LABEL version.ubuntu="22.04-lts" \
      version.hahlabs-mysql="alpha-00.05.02"
# Common Layers
# Update, Upgrade, install packages
RUN apt -y update \
   && apt -y upgrade \
   && apt install -y sudo vim 
ENV TZ="America/Vancouver"
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Vancouver apt-get -y install tzdata && ln -fs /usr/share/zoneinfo/America/Vancouver /etc/localtime
# Setup ops user use defaults uid 15286 gid 15286
WORKDIR /home/hahlabs
COPY common-files/. common-files/

RUN common-files/setup-user.sh \
 && common-files/setup-ssh-server.sh \
 && rm -rf common-files \
 && chown -R hahlabs:hahlabs /home/hahlabs 

# Adjust user root privileges, allow remote connections for root

USER hahlabs
# Enables the service on docker run container
ENTRYPOINT sudo ./startup.sh && bash