FROM golang:1.18-alpine AS go-builder
COPY ./ /circleci-exporter
WORKDIR /circleci-exporter
RUN go mod download
RUN GOOS=linux go build -o exporter .

FROM alpine
EXPOSE 9888
COPY --from=go-builder /circleci-exporter/exporter /exporter
ENTRYPOINT ["/exporter"]
