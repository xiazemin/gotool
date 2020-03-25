Web 程序使用 pprof

先写一个简单的 Web 服务程序。程序在 9876 端口上接收请求。

```
package main
 
import (
  "bytes"
  "io/ioutil"
  "log"
  "math/rand"
  "net/http"
 
  _ "net/http/pprof"
)
 
func main() {
  http.HandleFunc("/test", handler)
  log.Fatal(http.ListenAndServe(":9876", nil))
}
 
func handler(w http.ResponseWriter, r *http.Request) {
  err := r.ParseForm()
  if nil != err {
    w.Write([]byte(err.Error()))
    return
  }
  doSomeThingOne(10000)
  buff := genSomeBytes()
  b, err := ioutil.ReadAll(buff)
  if nil != err {
    w.Write([]byte(err.Error()))
    return
  }
  w.Write(b)
}
 
func doSomeThingOne(times int) {
  for i := 0; i < times; i++ {
    for j := 0; j < times; j++ {
 
    }
  }
}
 
func genSomeBytes() *bytes.Buffer {
  var buff bytes.Buffer
  for i := 1; i < 20000; i++ {
    buff.Write([]byte{'0' + byte(rand.Intn(10))})
  }
  return &buff
}
```

可以看到我们只是简单地引入了 net/http/pprof ，并未显示地使用。

启动程序。

我们用 wrk 来简单地模拟请求。

wrk -c 400 -t 8 -d 3m [http://localhost:9876/test](http://localhost:9876/test)

这时我们打开 [http://localhost:9876/debug/pprof，会显示如下页面：](http://localhost:9876/debug/pprof，会显示如下页面：)

用户可以点击相应的链接浏览内容。不过这不是我们重点讲述的，而且这些内容看起来并不直观。

我们打开链接 [http://localhost:9876/debug/pprof/profile](http://localhost:9876/debug/pprof/profile) 稍后片刻，可以下载到文件 profile。

