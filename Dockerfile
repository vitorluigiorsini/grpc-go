FROM golang:1.21

WORKDIR /usr/src/app

COPY . .

RUN apt-get update \
    && apt-get install -y protobuf-compiler \
    && apt-get install sqlite3 \
    && go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28 \
    && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2 \
    && export PATH="$PATH:$(go env GOPATH)/bin" \
    && go install github.com/ktr0731/evans@latest \
    && go mod tidy

CMD ["tail", "-f", "/dev/null"]
