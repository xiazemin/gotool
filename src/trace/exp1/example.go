package main
import (
"os"
"runtime/trace"
	"fmt"
	"sync"
)

func main() {
	f, err := os.Create("trace.out")
	if err != nil {
		panic(err)
	}
	defer f.Close()

	err = trace.Start(f)
	if err != nil {
		panic(err)
	}
	defer trace.Stop()
	// Your program here
	var wg sync.WaitGroup
	wg.Add(100)
	for i:=0;i<100;i++{
		go func(i int) {
			fmt.Println(i)
			wg.Done()
		}(i)
	}
	fmt.Println("hello")
	wg.Wait()
}