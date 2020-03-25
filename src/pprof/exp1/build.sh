#!/bin/bash
go build -o m main.go
./m
./m -cpu
go tool pprof cpu.pprof
dot -version

go tool pprof -svg cpu.pprof /Users/didi/GitBook/xiazm/Import/gotool/src/pprof/exp1
go tool pprof -pdf cpu.pprof ./

$ tree
.
├── build.sh
├── cpu.pprof
├── m
├── main.go
├── profile001.pdf
└── profile001.svg

