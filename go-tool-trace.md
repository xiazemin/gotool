pprof

今天生产环境突然出现了问题，机智的你早已埋好 \_ "net/http/pprof" 这个神奇的工具，你麻利的执行了如下命令：

curl [http://127.0.0.1:6060/debug/pprof/trace?seconds=20](http://127.0.0.1:6060/debug/pprof/trace?seconds=20) &gt; trace.out

go tool trace trace.out

View trace

你很快的看到了熟悉的 List 界面，然后不信邪点开了 View trace 界面，：

完全看懵的你，稳住，对着合适的区域执行快捷键 W 不断地放大时间线，

经过初步排查，你发现上述绝大部分的 G 竟然都和 google.golang.org/grpc.\(\*Server\).Serve.func 有关，关联的一大串也是 Serve 所触发的相关动作。

这时候有经验的你心里已经有了初步结论，你可以继续追踪 View trace 深入进去，不过我建议先鸟瞰全貌，因此我们再往下看 “Network blocking profile” 和 “Syscall blocking profile” 所提供的信息，如下：

Network blocking profile

Syscall blocking profile

通过对以上三项的跟踪分析，加上这个泄露，这个阻塞的耗时，这个涉及的内部方法名，很明显就是哪位又忘记关闭客户端连接了，赶紧改改改。

总结

通过本文我们习得了 go tool trace 的武林秘籍，它能够跟踪捕获各种执行中的事件，例如 Goroutine 的创建/阻塞/解除阻塞，Syscall 的进入/退出/阻止，GC 事件，Heap 的大小改变，Processor 启动/停止等等。

希望你能够用好 Go 的两大杀器 pprof + trace 组合，此乃排查好搭档，谁用谁清楚，即使他并不万能。

