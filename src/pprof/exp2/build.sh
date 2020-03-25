$ go tool pprof --pdf ./mem.pprof ./
./: read ./: is a directory
Fetched 1 source profiles out of 2
Generating report in profile001.pdf

$ go tool pprof --pdf ./m ./mem.pprof > cpu.pdf


$ go tool pprof --text ./mem.pprof ./
./: read ./: is a directory
Fetched 1 source profiles out of 2
Type: cpu
Time: Mar 25, 2020 at 12:03pm (CST)
Duration: 205.19ms, Total samples = 90ms (43.86%)
Showing nodes accounting for 90ms, 100% of 90ms total
      flat  flat%   sum%        cum   cum%
      40ms 44.44% 44.44%       40ms 44.44%  main.makeSlice
      40ms 44.44% 88.89%       40ms 44.44%  runtime.usleep
      10ms 11.11%   100%       10ms 11.11%  main.sumSlice
         0     0%   100%       50ms 55.56%  main.main
         0     0%   100%       40ms 44.44%  runtime.gcBgMarkWorker.func2
         0     0%   100%       40ms 44.44%  runtime.gcDrain
         0     0%   100%       50ms 55.56%  runtime.main
         0     0%   100%       40ms 44.44%  runtime.markroot
         0     0%   100%       40ms 44.44%  runtime.markroot.func1
         0     0%   100%       40ms 44.44%  runtime.mstart
         0     0%   100%       40ms 44.44%  runtime.osyield
         0     0%   100%       40ms 44.44%  runtime.scang
         0     0%   100%       40ms 44.44%  runtime.systemstack

go tool pprof -svg ./m ./mem.pprof > cpu.svg