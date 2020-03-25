我们用wrk来简单地模拟请求。

wrk -c 400 -t 8 -d 3m http://localhost:9876/test

这时我们打开 http://localhost:9876/debug/pprof，会显示如下页面：![](/assets/import7.png)



