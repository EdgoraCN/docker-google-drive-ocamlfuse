FROM ubuntu:bionic
MAINTAINER maltokyo <maltokyo@gmail.com>

ENV DRIVE_PATH="/mnt/gdrive"
# for china
#COPY ./sources.list  /etc/apt/sources.list
RUN  apt-get update -y \
 && apt-get install -yy gnupg \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F639B041 \
 && echo "deb http://ppa.launchpad.net/alessandro-strada/ppa/ubuntu bionic main" >> /etc/apt/sources.list \
 && echo "deb-src http://ppa.launchpad.net/alessandro-strada/ppa/ubuntu bionic main" >> /etc/apt/sources.list \
 && apt-get update -y \
 && apt-get install -yy google-drive-ocamlfuse fuse \
 && apt-get clean all \
 && echo "user_allow_other" >> /etc/fuse.conf \
 && rm /var/log/apt/* /var/log/alternatives.log /var/log/bootstrap.log /var/log/dpkg.log

COPY docker-entrypoint.sh /usr/local/bin/

CMD ["docker-entrypoint.sh"]
