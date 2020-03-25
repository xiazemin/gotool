#!/bin/bash
go build -o m main.go
./m

$wrk -c 400 -t 8 -d 3m http://localhost:9876/test
Running 3m test @ http://localhost:9876/test
  8 threads and 400 connections

    Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   702.15ms  510.04ms   2.00s    67.56%
    Req/Sec    10.31      9.99    80.00     87.38%
  8383 requests in 3.00m, 160.99MB read
  Socket errors: connect 0, read 242, write 1, timeout 5208
Requests/sec:     46.55
Transfer/sec:      0.89MB


$go tool pprof --svg ./m profile > ./profile.svg

$ go tool pprof ./m profile
File: m
Type: cpu
Time: Mar 25, 2020 at 4:39pm (CST)
Duration: 30.01s, Total samples = 0
No samples were found with the default sample value type.
Try "sample_index" command to analyze different sample values.
Entering interactive mode (type "help" for commands, "o" for options)
(pprof) top
Showing nodes accounting for 0, 0% of 0 total
      flat  flat%   sum%        cum   cum%
(pprof) exit


$go-torch ./m  profile
INFO[16:43:37] Run pprof command: go tool pprof -raw -seconds 30 ./m profile
ERROR: No stack counts found
FATAL[16:43:37] Failed: could not generate flame graph: exit status 2

$curl -O  http://localhost:9876/debug/pprof/heap

$go tool pprof m heap
File: m
Type: inuse_space
Time: Mar 25, 2020 at 4:45pm (CST)
Entering interactive mode (type "help" for commands, "o" for options)
(pprof) top
Showing nodes accounting for 1.50MB, 100% of 1.50MB total
      flat  flat%   sum%        cum   cum%
    1.50MB   100%   100%     1.50MB   100%  runtime.malg
         0     0%   100%     1.50MB   100%  runtime.mstart
         0     0%   100%     1.50MB   100%  runtime.newproc.func1
         0     0%   100%     1.50MB   100%  runtime.newproc1
         0     0%   100%     1.50MB   100%  runtime.systemstack
(pprof)

$go tool pprof --svg m heap > heap.svg

$curl 127.0.0.1:9876/debug/pprof/trace?seconds=10 > trace.data
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1994  100  1994    0     0    199      0  0:00:10  0:00:10 --:--:--   525

$go tool trace -http=':8888' m trace.data
2020/03/25 17:52:56 Parsing trace...
2020/03/25 17:52:56 Splitting trace...
2020/03/25 17:52:56 Opening browser. Trace viewer is listening on http://[::]:8888




