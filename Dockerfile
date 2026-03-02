FROM golang:1.22-alpine AS builder
WORKDIR /src
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -trimpath -ldflags="-s -w" -o /fullcycle main.go

FROM scratch
COPY --from=builder /fullcycle /fullcycle
ENTRYPOINT ["/fullcycle"]
