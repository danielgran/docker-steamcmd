FROM debian:bullseye

WORKDIR /steamcmd
ENV PATH "$PATH:/usr/games"
RUN mkdir -p /steamcmd
COPY install.sh .
COPY sources.list /etc/apt/sources.list

RUN apt update
RUN apt install -y sudo wget git ca-certificates nano expect apt-transport-https lib32gcc-s1 net-tools tree
RUN dpkg --add-architecture i386
RUN dpkg --configure -a
RUN apt update
RUN chmod +x install.sh
RUN ./install.sh 

RUN steamcmd +quit