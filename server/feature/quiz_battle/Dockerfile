
FROM golang:1.22.2-alpine
WORKDIR /app
COPY ./code .
RUN go mod download
RUN go build -o main .
EXPOSE 8080
CMD ["./main"]