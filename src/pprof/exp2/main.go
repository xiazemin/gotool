package main

import (
	"fmt"
	//"github.com/pkg/profile"
	"runtime/pprof"
	"os"
)

func main() {
	file, err := os.Create("./mem.pprof")
	defer file.Close()

	if err!=nil{
		fmt.Println(err)
		return
	}
	pprof.StartCPUProfile(file)
	defer pprof.StopCPUProfile()

	sl := makeSlice()
	fmt.Printf("sum = %d\n", sumSlice(sl))
	//pprof.WriteHeapProfile(file)

}

func makeSlice() []int {
	sl := make([]int, 10000000)
	for idx := range sl {
		sl[idx] = idx
	}
	return sl
}

func sumSlice(sl []int) int {
	sum := 0
	for _, x := range sl {
		sum += x
	}
	return sum
}