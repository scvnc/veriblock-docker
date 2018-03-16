FROM alpine

ARG VERSION=0.1.0

WORKDIR /tmp
RUN wget -O nodecore.tar https://github.com/VeriBlock/nodecore-releases/releases/download/v${VERSION}/nodecore-${VERSION}.tar 

FROM openjdk:8-jre-slim

COPY --from=0 /tmp/nodecore.tar /tmp/nodecore.tar
RUN tar --strip-components=1 -C / -xvf /tmp/nodecore.tar && rm /tmp/nodecore.tar

WORKDIR /data
VOLUME /data

EXPOSE 10500 6500 8501

ENTRYPOINT ["nodecore"]