# Forked from https://github.com/sequenceiq/docker-alpine-dig

FROM alpine:3.4
MAINTAINER Ciro S. Costa <ciro.costa@liferay.com>

RUN set -x && \
    export BUILD_DEPS="alpine-sdk linux-headers"                          &&  \

    apk add --update --virtual build_deps $BUILD_DEPS                     &&  \ 
    curl ftp://ftp.isc.org/isc/bind9/9.10.2/bind-9.10.2.tar.gz|tar -xzv   &&  \
    cd bind-9.10.2                                                        &&  \
    CFLAGS="-static" ./configure --without-openssl --disable-symtable     &&  \
    make                                                                  &&  \
    cp ./bin/dig/dig /usr/bin/                                            &&  \

    apk del build_deps                                                    &&  \
    rm -rf /var/cache/apk/*                                               &&  \
    rm -rf bind-9.10.2/

