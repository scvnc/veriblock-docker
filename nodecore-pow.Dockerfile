FROM alpine

ARG VERSION=0.4.3

WORKDIR /tmp
RUN wget -O pow.tar https://github.com/VeriBlock/nodecore-releases/releases/download/v${VERSION}/veriblock-nodecore-all-${VERSION}.tar

FROM openjdk:8-jre-slim

COPY --from=0 /tmp/pow.tar /tmp/pow.tar
RUN tar --strip-components=1 -C / -xvf /tmp/pow.tar && \
    rm /tmp/pow.tar

WORKDIR /data
VOLUME /data

ENV CORES='-1'
ENV POOL_ADDR=127.0.0.1:6501
ENV ADDR=''

CMD ["/bin/bash", "-c", "echo -e \"${CORES}\n${POOL_ADDR}\n${ADDR}\n\" | nodecore-pow"]