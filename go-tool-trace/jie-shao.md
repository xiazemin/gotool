`go tool trace`

可以向你揭示：Go程序运行中的所有的运行时事件。 这种工具是Go生态系统中用于诊断性能问题时（如延迟，并行化和竞争异常）最有用的工具之一。

`go tool trace`

UI是一个Web应用程序。

有一些你可以从这个追踪中找到的有价值的信息：

* 这个程序运行多长时间？

* 有多少goroutines运行872微秒？

* 该进程何时第一次升级到使用三个OS线程？

* 什么时候主要调用qSortPar？

* 是什么导致额外的过程（1,2和3）开始工作？

* proc＃2什么时候停止？

  这涉及从标准库导入runtime/trace

```
package main
import (
"os"
"runtime/trace"
)

func main() {
    f, err := os.Create("trace.out")
    if err != nil {
        panic(err)
    }
    defer f.Close()

    err = trace.Start(f)
    if err != nil {
        panic(err)
    }
    defer trace.Stop()
    // Your program here
}
```

这将使您的程序以二进制格式在文件trace.out中写入事件数据。 然后可以运行go tool trace trace.out。 这将解析跟踪文件，并使用可视化程序打开浏览器。 该命令还将启动服务器，并使用跟踪数据来响应可视化操作。 在浏览器中加载初始页面后，单击“View trace”。 这将加载跟踪查看器，如上面嵌入的那样。

