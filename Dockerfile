FROM debian:bullseye

WORKDIR /steamcmd
ENV PATH "$PATH:/usr/games"
RUN mkdir -p /steamcmd
COPY install.sh .
COPY sources.list /etc/apt/sources.list

RUN apt update && \
  apt install -y sudo wget git ca-certificates nano expect apt-transport-https lib32gcc-s1 net-tools tree && \
  dpkg --add-architecture i386 && \
  dpkg --configure -a && \
  apt update && \
  chmod +x install.sh && \
  ./install.sh && \
  steamcmd +quit