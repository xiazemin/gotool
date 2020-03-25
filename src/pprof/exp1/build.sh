#!/bin/bash
go build -o m main.go
./m
./m -cpu
go tool pprof cpu.pprof
dot -version
