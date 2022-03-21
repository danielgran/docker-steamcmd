FROM debian:bullseye

WORKDIR /steamcmd
RUN mkdir -p /steamcmd

RUN apt update && \
  apt install -y sudo wget git ca-certificates nano && \
  sudo apt update && \
  sudo apt install -y apt-transport-https

COPY sources.list /etc/apt/sources.list
RUN dpkg --add-architecture i386 && \ 
  apt update && \
  apt install -y steamcmd
