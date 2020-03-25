#!/bin/bash
go build -o m main.go
./m 2> trace.out
go tool trace trace.out