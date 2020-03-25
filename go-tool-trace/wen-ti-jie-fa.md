```
go build -o m example.go
./m
go tool trace trace.out

#panic: template: :98: unexpected {{end}}

#goroutine 1 [running]:
#html/template.Must(0x0, 0x156cc20, 0xc000091890, 0x0)
#        /usr/local/go/src/html/template/template.go:372 +0x54
#main.init()
#        /usr/local/go/src/cmd/trace/goroutines.go:164 +0x702

解决办法
先运行 go tool trace
再运行 go tool trace trace.out
原因：查找中
```



