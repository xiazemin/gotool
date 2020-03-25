package main
import "net/http"
import
(_ "net/http/pprof"
"log"
"bytes"
"fmt"
	"io"
	//"time"
)

func main() {
// "主函数中添加
go func() {
http.HandleFunc("/program/html", htmlHandler) // 用来查看自定义的内容
log.Println(http.ListenAndServe("0.0.0.0:8080", nil))
}()
	select {

	}
}

func writeBuf(buffer *bytes.Buffer, format string, a ...interface{}) {
	(*buffer).WriteString(fmt.Sprintf(format, a...))
}
func htmlHandler(w http.ResponseWriter, req *http.Request) {
	io.WriteString(w, statusHtml())
}
// 访问 localhost:8080/program/html 可以看到一个表格，一秒钟刷新一次
func statusHtml() string {
	var buf bytes.Buffer
	buf.WriteString("<html><meta http-equiv=\"refresh\" content=\"1\">" +
		"<body><h2>netflow-decoder status count</h2>" +
		"<table width=\"500px\" border=\"1\" cellpadding=\"5\" cellspacing=\"1\">" +
		"<tr><th>NAME</th><th>TOTAL</th><th>SPEED</th></tr>")
	//writeBuf(&buf, "<tr><td>UDP</td><td>%d</td><td>%d</td></tr>",
	//	lastRecord.RecvUDP, currSpeed.RecvUDP)
	//...
	//writeBuf(&buf, "</table><p>Count time: %s</p><p>Time now: %s</p>",
	//	countTime.Format("2006-01-02 15:04:05"), time.Now().Format("2006-01-02 15:04:05"))
	buf.WriteString("</body></html>")
	return buf.String()
}