# Set up Protobuffers with TypeScript

1. install protobuf on machine (https://github.com/protocolbuffers/protobuf/releases)
2. `npm install save--dev ts-proto`

## compile .proto files

### on linux/max

this will place *.ts files next to the corresponding *.proto files

```
protoc --plugin=./node_modules/.bin/protoc-gen-ts_proto --ts_proto_out=. ./simple.proto
```

### on windows

```
protoc --plugin=protoc-gen-ts_proto=.\node_modules\.bin\protoc-gen-ts_proto.cmd --ts_proto_out=. ./simple.proto
```
