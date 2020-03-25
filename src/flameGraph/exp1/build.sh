#!/bin/bash
go build -o m  main.go
./m

$go-torch -u http://127.0.0.1:8080
INFO[13:48:29] Run pprof command: go tool pprof -raw -seconds 30 http://127.0.0.1:8080/debug/pprof/profile
ERROR: No stack counts found

$go-torch -alloc_space http://127.0.0.1:8080/debug/pprof/heap --colors=mem
INFO[13:51:37] Run pprof command: go tool pprof -raw -seconds 30 -alloc_space http://127.0.0.1:8080/debug/pprof/heap
INFO[13:51:37] Writing svg to torch.svg


$go-torch -inuse_space http://127.0.0.1:8080/debug/pprof/heap --colors=mem
INFO[13:53:28] Run pprof command: go tool pprof -raw -seconds 30 -inuse_space http://127.0.0.1:8080/debug/pprof/heap
INFO[13:53:28] Writing svg to torch.svg

$go tool pprof -alloc_space -cum -svg http://127.0.0.1:8080/debug/pprof/heap > heap.svg
Fetching profile over HTTP from http://127.0.0.1:8080/debug/pprof/heap
Saved profile in /Users/didi/pprof/pprof.alloc_objects.alloc_space.inuse_objects.inuse_space.006.pb.gz

