`go tool trace`

displays a lot of information, so it is hard to know where to start. Let’s get a rough overview of the interface first, and then we’ll look at how you can investigate specific problems with it.

![](https://making.pusher.com/images/2017-03-22-go-tool-trace/tour.svg)[https://making.pusher.com/images/2017-03-22-go-tool-trace/tour.svg](https://making.pusher.com/images/2017-03-22-go-tool-trace/tour.svg)

单单使用 PProf 有时候不一定足够完整，因为在真实的程序中还包含许多的隐藏动作，例如 Goroutine 在执行时会做哪些操作？执行/阻塞了多长时间？在什么时候阻止？在哪里被阻止的？谁又锁/解锁了它们？GC 是怎么影响到 Goroutine 的执行的？这些东西用 PProf 是很难分析出来的，但如果你又想知道上述的答案的话，你可以用本文的主角 go tool trace 来打开新世界的大门。



