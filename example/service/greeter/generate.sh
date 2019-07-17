#!/usr/bin/env bash

# Make sure this script has been executed directly, and not sourced.
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "This '$(basename "${BASH_SOURCE[0]}")' script must be executed directly, not sourced."
    return 1
fi

set -euo pipefail

# Make sure we are in this script's directory, as the 'protoc' commands below use relative paths.
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

protoc -I/usr/local/include -I. \
    -I"$GOPATH"/src \
    -I"$GOPATH"/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
    --go_out=plugins=grpc:. \
    greeter.proto

protoc -I/usr/local/include -I. \
    -I"$GOPATH"/src \
    -I"$GOPATH"/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
    --grpc-gateway_out=logtostderr=true:. \
    greeter.proto
