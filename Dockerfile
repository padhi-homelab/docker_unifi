FROM debian:stretch-slim AS base
ARG TARGETARCH


LABEL maintainer="Saswat Padhi saswat.sourav@gmail.com"


FROM base AS base-amd64
ENV DPKG_ARCH=amd64

FROM base AS base-386
ENV DPKG_ARCH=i386

FROM base AS base-arm64
ENV DPKG_ARCH=arm64

FROM base AS base-armv7
ENV DPKG_ARCH=armhf

FROM base-${TARGETARCH}${TARGETVARIANT}


ARG UNIFI_VERSION=6.0.41
ARG GOSU_VERSION=1.12

ARG UNIFI_SOURCE_DEB=https://dl.ui.com/unifi/${UNIFI_VERSION}/unifi_sysvinit_all.deb
ADD ${UNIFI_SOURCE_DEB} /tmp/unifi.deb

ARG GOSU_BINARY=https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-${DPKG_ARCH}
ADD ${GOSU_BINARY} /usr/local/bin/gosu


ENV DEBIAN_FRONTEND=noninteractive \
    BASEDIR=/usr/lib/unifi \
    DATADIR=/unifi/data \
    LOGDIR=/unifi/log \
    CERTDIR=/unifi/cert \
    RUNDIR=/var/run/unifi \
    BIND_PRIV=true \
    RUNAS_UID0=false \
    UNIFI_GID=999 \
    UNIFI_UID=999

RUN chmod +x /usr/local/bin/gosu \
 && gosu nobody true \
 && mkdir -p ${CERTDIR} \
             ${DATADIR} \
             ${LOGDIR} \
             /usr/local/unifi/init.d \
             /usr/unifi \
             /usr/unifi/init.d \
             /usr/share/man/man1/ \
             /var/cert \
 && groupadd -r unifi -g $UNIFI_GID \
 && useradd --no-log-init -r -u $UNIFI_UID -g $UNIFI_GID unifi \
 && mkdir /tmp/unifi-fixed \
 && dpkg-deb -R /tmp/unifi.deb /tmp/unifi-fixed \
 && sed -i '/mongodb/d' /tmp/unifi-fixed/DEBIAN/control \
 && dpkg-deb -b /tmp/unifi-fixed /tmp/unifi-fixed.deb \
 && apt-get update \
 && apt-get upgrade \
 && apt-get install -qy --no-install-recommends \
            apt-transport-https \
            binutils \
            ca-certificates \
            curl \
            dirmngr \
            libcap2-bin \
            logrotate \
            openjdk-8-jre-headless \
            procps \
            /tmp/unifi-fixed.deb \
 && apt-get autoclean \
 && apt-get autoremove --purge -y \
 && rm -rf /tmp/* \
           /var/lib/apt/lists/* \
           /var/tmp/* \
 && ln -s ${DATADIR} ${BASEDIR}/data \
 && ln -s ${RUNDIR} ${BASEDIR}/run \
 && ln -s ${LOGDIR} ${BASEDIR}/logs \
 && ln -s ${CERTDIR} /var/cert/unifi \
 && chown -R unifi:unifi ${BASEDIR} \
                         ${CERTDIR} \
                         ${DATADIR} \
                         ${LOGDIR} \
                         ${RUNDIR}

COPY root/ /

VOLUME ["/unifi", "${RUNDIR}"]

EXPOSE 3478/udp \
       5514/udp \
       6789/tcp \
       8080/tcp \
       8443/tcp \
       8843/tcp \
       8880/tcp \
       10001/udp

WORKDIR /unifi

ENTRYPOINT ["bash", "/entrypoint.sh"]

CMD ["unifi"]

HEALTHCHECK --start-period=5m --interval=120s --timeout=5s --retries=3 \
        CMD ["bash", "/health.sh"]