#!/bin/bash
brew install wrk
wrk -c 400 -t 8 -d 3m http://localhost:9876/test
-c, --connections <N>  跟服务器建立并保持的TCP连接数量
-d, --duration    <T>  压测时间
-t, --threads     <N>  使用多少个线程进行压测