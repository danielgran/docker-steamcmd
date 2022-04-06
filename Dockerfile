FROM danielgran/debian-base

WORKDIR /steamcmd
ENV PATH "$PATH:/usr/games"
RUN mkdir -p /steamcmd
COPY install.sh .
COPY sources.list /etc/apt/sources.list

RUN apt install -y expect lib32gcc-s1 && \
    dpkg --add-architecture i386 && \
    dpkg --configure -a && \
    apt update && \
    chmod +x install.sh && \
    ./install.sh && \
    steamcmd +quit