# Introduction

在 go 语言中，主要关注的应用运行情况主要包括以下几种：

* CPU profile：报告程序的 CPU 使用情况，按照一定频率去采集应用程序在 CPU 和寄存器上面的数据
* Memory Profile（Heap Profile）：报告程序的内存使用情况
* Block Profiling：报告 goroutines 不在运行状态的情况，可以用来分析和查找死锁等性能瓶颈
* Goroutine Profiling：报告 goroutines 的使用情况，有哪些 goroutine，它们的调用关系是怎样的

## 两种收集方式 {#两种收集方式}

做 Profiling 第一步就是怎么获取应用程序的运行情况数据。go 语言提供了 `runtime/pprof` 和 `net/http/pprof` 两个库，这部分我们讲讲它们的用法以及使用场景。

`go tool pprof`

 最简单的使用方式为 

`go tool pprof [binary] [source]`

，

`binary`

 是应用的二进制文件，用来解析各种符号；

`source`

 表示 profile 数据的来源，可以是本地的文件，也可以是 http 地址。



