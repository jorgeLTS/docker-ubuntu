FROM ubuntu:20.04

LABEL maintainer="Jorge Mendoza (github.com/jorgeLTS)"

### Set defaults
ENV DEBCONF_NONINTERACTIVE_SEEN=true \
        DEBUG_MODE=FALSE \
        TZ=America/Mexico_City

### Dependencies Addon
RUN set -x && \
    apt-get update && \
    apt-get install -y \
        ca-certificates \
        language-pack-es \
        apt-transport-https \
        lsb-release && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata && \
    dpkg-reconfigure tzdata