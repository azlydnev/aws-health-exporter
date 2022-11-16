FROM golang:alpine

ARG SOURCE_COMMIT

ADD . /go/src/github.com/azlydnev/aws-health-exporter
WORKDIR /go/src/github.com/azlydnev/aws-health-exporter

RUN DATE=$(date -u '+%Y-%m-%d-%H%M UTC'); \
    go install -ldflags="-X 'main.Version=${SOURCE_COMMIT}' -X 'main.BuildTime=${DATE}'" ./...

ENTRYPOINT  [ "/go/bin/aws-health-exporter" ]
EXPOSE      9383
