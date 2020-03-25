安装

go get github.com/uber/go-torch

\# 再安装 brendangregg/FlameGraph 

export PATH=$PATH:/absolute/path/FlameGraph-master

\# 还需要安装一个graphviz用来画内存图

yum install graphviz



https://studygolang.com/articles/11556

&lt;!-- more --&gt;

import "net/http"

import \_ "net/http/pprof"

func main\(\) {

    // 主函数中添加

    go func\(\) {

		http.HandleFunc\("/program/html", htmlHandler\) // 用来查看自定义的内容

		log.Println\(http.ListenAndServe\("0.0.0.0:8080", nil\)\)

	}\(\)

}



使用

\# 用 -u 分析CPU使用情况

./go-torch -u http://127.0.0.1:8080

\# 用 -alloc\_space 来分析内存的临时分配情况

./go-torch -alloc\_space http://127.0.0.1:8080/debug/pprof/heap --colors=mem

\# 用 -inuse\_space 来分析程序常驻内存的占用情况；

./go-torch -inuse\_space http://127.0.0.1:8080/debug/pprof/heap --colors=mem

\# 画出内存分配图

go tool pprof -alloc\_space -cum -svg http://127.0.0.1:8080/debug/pprof/heap &gt; heap.svg





查看

使用浏览器查看svg文件，程序运行中，可以登录 http://127.0.0.1:10086/debug/pprof/ 查看程序实时状态 在此基础上，可以通过配置handle来实现自定义的内容查看，可以添加Html格式的输出，优化显示效果



func writeBuf\(buffer \*bytes.Buffer, format string, a ...interface{}\) {

	\(\*buffer\).WriteString\(fmt.Sprintf\(format, a...\)\)

}

func htmlHandler\(w http.ResponseWriter, req \*http.Request\) {

	io.WriteString\(w, statusHtml\(\)\)

}

// 访问 localhost:8080/program/html 可以看到一个表格，一秒钟刷新一次

func statusHtml\(\) string {

	var buf bytes.Buffer

	buf.WriteString\("&lt;html&gt;&lt;meta http-equiv=\"refresh\" content=\"1\"&gt;" +

		"&lt;body&gt;&lt;h2&gt;netflow-decoder status count&lt;/h2&gt;" +

		"&lt;table width=\"500px\" border=\"1\" cellpadding=\"5\" cellspacing=\"1\"&gt;" +

		"&lt;tr&gt;&lt;th&gt;NAME&lt;/th&gt;&lt;th&gt;TOTAL&lt;/th&gt;&lt;th&gt;SPEED&lt;/th&gt;&lt;/tr&gt;"\)

	writeBuf\(&buf, "&lt;tr&gt;&lt;td&gt;UDP&lt;/td&gt;&lt;td&gt;%d&lt;/td&gt;&lt;td&gt;%d&lt;/td&gt;&lt;/tr&gt;",

		lastRecord.RecvUDP, currSpeed.RecvUDP\)

	...

	writeBuf\(&buf, "&lt;/table&gt;&lt;p&gt;Count time: %s&lt;/p&gt;&lt;p&gt;Time now: %s&lt;/p&gt;",

		countTime.Format\("2006-01-02 15:04:05"\), time.Now\(\).Format\("2006-01-02 15:04:05"\)\)

	buf.WriteString\("&lt;/body&gt;&lt;/html&gt;"\)

	return buf.String\(\)

}

