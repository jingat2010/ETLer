FROM golang:1.17-alpine
WORKDIR /app
COPY . .
#ENV GOPROXY="https://goproxy.io"
#RUN apk update && apk add --no-cache gcc && apk add --no-cache libc-dev
RUN go mod download && go mod verify
#COPY . .
RUN go build -o ./etler_server ./main/main.go
ENTRYPOINT ["/app/etler_server"]