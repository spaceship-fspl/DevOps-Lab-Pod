FROM golang:alpine as builder
RUN mkdir /go/src/app
ADD . /go/src/app/
WORKDIR /go/src/app
RUN go build app .
RUN chmod +x app

FROM alpine
COPY --from=builder /go/src/app/app /app
RUN apk update && \
    apk add ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

EXPOSE 80 443
CMD ["./app"]
