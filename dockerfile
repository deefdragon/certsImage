FROM golang:alpine as builder
RUN apk update && apk upgrade && apk add --no-cache ca-certificates
RUN update-ca-certificates

FROM alpine
RUN apk --no-cache add curl
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
