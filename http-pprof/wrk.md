我们用wrk来简单地模拟请求。

wrk -c 400 -t 8 -d 3m [http://localhost:9876/test](http://localhost:9876/test)

这时我们打开 [http://localhost:9876/debug/pprof，会显示如下页面：](http://localhost:9876/debug/pprof，会显示如下页面：![]%28/assets/import7.png)

![](/assets/import8.png)

用户可以点击相应的链接浏览内容。不过这不是我们重点讲述的，而且这些内容看起来并不直观。

我们打开链接[http://localhost:9876/debug/pprof/profile稍后片刻，可以下载到文件](http://localhost:9876/debug/pprof/profile稍后片刻，可以下载到文件) profile。

使用 Go 自带的 pprof 工具打开。go tool pprof test profile。（proof 后跟的 test 为程序编译的可执行文件）

$curl -O http://localhost:9876/debug/pprof/profile

