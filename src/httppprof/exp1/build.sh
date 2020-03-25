#!/bin/bash
brew install wrk
wrk -c 400 -t 8 -d 3m http://localhost:9876/test
-c, --connections <N>  跟服务器建立并保持的TCP连接数量
-d, --duration    <T>  压测时间
-t, --threads     <N>  使用多少个线程进行压测


$curl -O http://localhost:9876/debug/pprof/profile

$go tool pprof ./m profile
File: m
Type: cpu
Time: Mar 25, 2020 at 4:27pm (CST)
Duration: 30s, Total samples = 0
No samples were found with the default sample value type.
Try "sample_index" command to analyze different sample values.
Entering interactive mode (type "help" for commands, "o" for options)
(pprof) top
Showing nodes accounting for 0, 0% of 0 total
      flat  flat%   sum%        cum   cum%


 $go tool pprof --svg ./m profile > ./profile.svg


 $go tool pprof m profile
 File: m
 Type: cpu
 Time: Mar 25, 2020 at 4:54pm (CST)
 Duration: 30s, Total samples = 10ms (0.033%)
 Entering interactive mode (type "help" for commands, "o" for options)
 (pprof) top


 Showing nodes accounting for 10ms, 100% of 10ms total
       flat  flat%   sum%        cum   cum%
       10ms   100%   100%       10ms   100%  runtime.pthread_cond_wait
          0     0%   100%       10ms   100%  runtime.findrunnable
          0     0%   100%       10ms   100%  runtime.mcall
          0     0%   100%       10ms   100%  runtime.notesleep
          0     0%   100%       10ms   100%  runtime.park_m
          0     0%   100%       10ms   100%  runtime.schedule
          0     0%   100%       10ms   100%  runtime.semasleep
          0     0%   100%       10ms   100%  runtime.stopm


  $go-torch ./m  profile
  INFO[16:56:43] Run pprof command: go tool pprof -raw -seconds 30 ./m profile
  INFO[16:56:43] Writing svg to torch.svg


