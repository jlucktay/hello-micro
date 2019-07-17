# Running this example

## TL;DR

From this directory:

1. `./service/greeter/generate.sh`
1. `go run ./service/greeter/service.go --registry=mdns --server_address=localhost:9090`
1. `go run ./gateway/`
1. `curl --silent --data '{"name": "James"}' localhost:8080/greeter/hello`

## Binary/library/plugin dependencies

1. [protobuf](https://github.com/protocolbuffers/protobuf)
1. [protoc](https://github.com/golang/protobuf)
1. [micro](https://github.com/micro/micro)
1. [go-micro](https://github.com/micro/go-micro)
1. [protoc-gen-micro](https://github.com/micro/protoc-gen-micro)
1. [protoc-gen-grpc-gateway](https://github.com/grpc-ecosystem/grpc-gateway/tree/master/protoc-gen-grpc-gateway)
