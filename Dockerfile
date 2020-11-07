FROM        python:3.7-slim

LABEL       author="Arnaud Lier" maintainer="zeprofdecoding@gmail.com"

RUN         apt update \
            && apt -y install git gcc g++ ca-certificates dnsutils curl iproute2 ffmpeg \
            && useradd -m -d /home/container container

# Ensure UTF-8
ENV         LANG fr_FR.UTF-8
ENV         LC_ALL fr_FR.UTF-8
ENV         TZ=Europe/Paris

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
