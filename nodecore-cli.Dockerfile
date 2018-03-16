FROM alpine

ARG VERSION=0.1.0

WORKDIR /tmp
RUN wget -O cli.tar https://github.com/VeriBlock/nodecore-releases/releases/download/v${VERSION}/nodecore-cli-${VERSION}.tar

FROM openjdk:8-jre-slim

COPY --from=0 /tmp/cli.tar /tmp/cli.tar
RUN tar --strip-components=1 -C / -xvf /tmp/cli.tar && \
    rm /tmp/cli.tar

ENTRYPOINT ["nodecore-cli"]