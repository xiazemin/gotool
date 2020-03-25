#!/bin/bash
go build -o m example.go
./m
go tool trace trace.out

#panic: template: :98: unexpected {{end}}

#goroutine 1 [running]:
#html/template.Must(0x0, 0x156cc20, 0xc000091890, 0x0)
#        /usr/local/go/src/html/template/template.go:372 +0x54
#main.init()
#        /usr/local/go/src/cmd/trace/goroutines.go:164 +0x702




fatal error: all goroutines are asleep - deadlock!

goroutine 1 [select (no cases)]:
main.main()
        /Users/didi/GitBook/xiazm/Import/gotool/src/trace/exp1/example.go:27 +0x1eb

goroutine 4 [trace reader (blocked)]:
runtime.goparkunlock(...)
        /usr/local/go/src/runtime/proc.go:310
runtime.ReadTrace(0xc00000e028, 0xc00008c000, 0x10)
        /usr/local/go/src/runtime/trace.go:395 +0x4ed
runtime/trace.Start.func1(0x10ee1c0, 0xc00000e028)
        /usr/local/go/src/runtime/trace/trace.go:129 +0x47
created by runtime/trace.Start
        /usr/local/go/src/runtime/trace/trace.go:127 +0xd8

