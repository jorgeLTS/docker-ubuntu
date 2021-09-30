FROM ubuntu:20.04

### Labels
LABEL maintainer="Jorge Mendoza (github.com/jorgeLTS)"

### Update
RUN apt-get update -y

### Set defaults
ENV DEBCONF_NONINTERACTIVE_SEEN=true \
        DEBUG_MODE=FALSE \
        TZ="America/Mexico_City" \
        LANG="es_MX.UTF-8" \
        LANGUAGE="es_MX:es" \
        LC_ALL="es_MX.UTF-8"

### Dependencies Addon
RUN set -x && \
    apt-get install -y \
        ca-certificates \
        language-pack-es \
        apt-transport-https \
        tzdata \
        lsb-release
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure tzdata
