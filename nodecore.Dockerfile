FROM alpine

ARG VERSION=0.4.3

WORKDIR /tmp
RUN wget -O nodecore.tar https://github.com/VeriBlock/nodecore-releases/releases/download/v${VERSION}/veriblock-nodecore-all-${VERSION}.tar

FROM store/oracle/serverjre:8

COPY --from=0 /tmp/nodecore.tar /tmp/nodecore.tar
RUN tar --strip-components=1 -C / -xvf /tmp/nodecore.tar && rm /tmp/nodecore.tar

WORKDIR /data
VOLUME /data

EXPOSE 10500 6500 8501

ENTRYPOINT ["nodecore"]