ARG ARCH="amd64"
ARG OS="linux"
FROM quay.io/prometheus/busybox:latest

ARG ARCH="amd64"
ARG OS="linux"
COPY .build/${OS}-${ARCH}/circleci-exporter /bin/circleci-exporter

LABEL org.opencontainers.image.source = "https://github.com/cpanato/circleci-exporter"

USER nobody
ENTRYPOINT ["/bin/circleci-exporter"]
EXPOSE     9101
