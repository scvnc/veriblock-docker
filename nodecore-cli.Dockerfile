FROM alpine

ARG VERSION=0.4.3

WORKDIR /tmp
RUN wget -O cli.tar https://github.com/VeriBlock/nodecore-releases/releases/download/v${VERSION}/veriblock-nodecore-all-${VERSION}.tar

FROM store/oracle/serverjre:8

COPY --from=0 /tmp/cli.tar /tmp/cli.tar
RUN tar --strip-components=1 -C / -xvf /tmp/cli.tar && \
    rm /tmp/cli.tar

ENTRYPOINT ["nodecore-cli"]