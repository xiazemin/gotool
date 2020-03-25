`go tool trace`

displays a lot of information, so it is hard to know where to start. Let’s get a rough overview of the interface first, and then we’ll look at how you can investigate specific problems with it.

![](https://making.pusher.com/images/2017-03-22-go-tool-trace/tour.svg)[https://making.pusher.com/images/2017-03-22-go-tool-trace/tour.svg](https://making.pusher.com/images/2017-03-22-go-tool-trace/tour.svg)

单单使用 PProf 有时候不一定足够完整，因为在真实的程序中还包含许多的隐藏动作，例如 Goroutine 在执行时会做哪些操作？执行/阻塞了多长时间？在什么时候阻止？在哪里被阻止的？谁又锁/解锁了它们？GC 是怎么影响到 Goroutine 的执行的？这些东西用 PProf 是很难分析出来的，但如果你又想知道上述的答案的话，你可以用本文的主角 go tool trace 来打开新世界的大门。

View trace：查看跟踪

Goroutine analysis：Goroutine 分析

Network blocking profile：网络阻塞概况

Synchronization blocking profile：同步阻塞概况

Syscall blocking profile：系统调用阻塞概况

Scheduler latency profile：调度延迟概况

User defined tasks：用户自定义任务

User defined regions：用户自定义区域

Minimum mutator utilization：最低 Mutator 利用率

Scheduler latency profile

在刚开始查看问题时，除非是很明显的现象，否则不应该一开始就陷入细节，因此我们一般先查看 “Scheduler latency profile”，我们能通过 Graph 看到整体的调用开销情况，如下：

![](/assets/import4.png)演示程序比较简单，因此这里就两块，一个是 trace 本身，另外一个是 channel 的收发。



Goroutine analysis

第二步看 “Goroutine analysis”，我们能通过这个功能看到整个运行过程中，每个函数块有多少个有 Goroutine 在跑，并且观察每个的 Goroutine 的运行开销都花费在哪个阶段



通过上图我们可以看到共有 3 个 goroutine，分别是 runtime.main、runtime/trace.Start.func1、main.main.func1，那么它都做了些什么事呢，接下来我们可以通过点击具体细项去观察。



同时也可以看到当前 Goroutine 在整个调用耗时中的占比，以及 GC 清扫和 GC 暂停等待的一些开销。如果你觉得还不够，可以把图表下载下来分析，相当于把整个 Goroutine 运行时掰开来看了，这块能够很好的帮助我们对 Goroutine 运行阶段做一个的剖析，可以得知到底慢哪，然后再决定下一步的排查方向。如下：



名称	含义	耗时

Execution Time	执行时间	3140ns

Network Wait Time	网络等待时间	0ns

Sync Block Time	同步阻塞时间	0ns

Blocking Syscall Time	调用阻塞时间	0ns

Scheduler Wait Time	调度等待时间	14ns

GC Sweeping	GC 清扫	0ns

GC Pause	GC 暂停	0ns

View trace

在对当前程序的 Goroutine 运行分布有了初步了解后，我们再通过 “查看跟踪” 看看之间的关联性，







