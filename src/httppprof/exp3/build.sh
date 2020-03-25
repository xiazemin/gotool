#!/bin/bash
go tool pprof  http://localhost:6060/debug/pprof/profile


$go tool pprof  http://localhost:6060/debug/pprof/profile
Fetching profile over HTTP from http://localhost:6060/debug/pprof/profile
Saved profile in /Users/didi/pprof/pprof.samples.cpu.008.pb.gz
Type: cpu
Time: Mar 25, 2020 at 5:58pm (CST)
Duration: 30s, Total samples = 960ms ( 3.20%)
Entering interactive mode (type "help" for commands, "o" for options)
(pprof) top
Showing nodes accounting for 850ms, 88.54% of 960ms total
Showing top 10 nodes out of 79
      flat  flat%   sum%        cum   cum%
     360ms 37.50% 37.50%      360ms 37.50%  syscall.syscall
     130ms 13.54% 51.04%      130ms 13.54%  runtime.nanotime
      80ms  8.33% 59.38%       80ms  8.33%  runtime.pthread_cond_signal
      80ms  8.33% 67.71%       80ms  8.33%  runtime.pthread_cond_timedwait_relative_np
      60ms  6.25% 73.96%       60ms  6.25%  runtime.pthread_cond_wait
      60ms  6.25% 80.21%       60ms  6.25%  runtime.usleep
      30ms  3.12% 83.33%       30ms  3.12%  runtime.mallocgc
      20ms  2.08% 85.42%       20ms  2.08%  fmt.(*pp).free
      20ms  2.08% 87.50%       20ms  2.08%  runtime.madvise
      10ms  1.04% 88.54%       10ms  1.04%  fmt.(*fmt).fmtInteger
(pprof)




go tool pprof --alloc_objects http://localhost:6060/debug/pprof/heap


$go-torch ./m  http://localhost:6060/debug/pprof/profile
INFO[18:01:38] Run pprof command: go tool pprof -raw -seconds 30 ./m http://localhost:6060/debug/pprof/profile
INFO[18:02:08] Writing svg to torch.svg
