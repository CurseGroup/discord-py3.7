FROM ubuntu:18.04

MAINTAINER Arnaud Lier, <zeprofdecoding@gmail.com>

RUN apt update \
    && apt upgrade -y \
    && apt autoremove -y \
    && apt autoclean \
    && apt -y install curl software-properties-common locales git cmake \
    && useradd -d /home/container -m container

    # Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TZ=America/New_York

    # Python3 & Dependencies
RUN apt -y install python3.7 python3-pip python2.7 python-pip libffi-dev mono-complete \
    && pip3 install aiohttp websockets pynacl opuslib libopus0 ffmpeg \
    && python3 -m pip install -U discord.py[voice]

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
