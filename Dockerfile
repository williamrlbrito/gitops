FROM golang:1.21.4 as builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server

FROM scratch
WORKDIR /app
COPY --from=builder /app/server .
ENTRYPOINT ["./server"]