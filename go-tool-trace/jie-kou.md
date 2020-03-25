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



