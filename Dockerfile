FROM golang:alpine as builder
WORKDIR /go/src/app
COPY main.go /go/src/app/
RUN go mod init && \
    go build -o /tmp/spaceship-devops-test

FROM alpine
RUN mkdir -p /opt/spaceship/bin
COPY --from=builder /tmp/spaceship-devops-test /opt/spaceship/bin/
EXPOSE 8080
CMD ["/opt/spaceship/bin/spaceship-devops-test"]
