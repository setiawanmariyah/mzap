# BUILDER
FROM golang:latest AS builder
WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go build -o mzap

# RUNNING
FROM debian:buster
RUN mkdir /app
COPY --from=builder /go/src/app/mzap /app/jwt-hack
WORKDIR /app/
CMD ["/app/mzap"]
