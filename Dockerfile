FROM michaelcoll/armhf-ubuntu:16.04

MAINTAINER Michael COLL <mick.coll@gmail.com>

ENV DEBIAN_FRONTEND="noninteractive" \
    TERM="xterm"

# Enable parallel downloads in apt
RUN echo 'Acquire::Queue-Mode "host";' >> /etc/apt/apt.conf

RUN apt-get -q update && \
    apt-get -qy dist-upgrade && \
    apt-get install -qy \
      apt-utils \
      ca-certificates \
      wget \
      curl \
      apt-transport-https \
    && \
    apt-get -y autoremove && \
    apt-get -y autoclean && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

