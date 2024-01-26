package main

import (
	"fmt"
	"runtime"
)

func main() {
	fmt.Println("Hello, world!")
	fmt.Printf("build on %s [%s, %s]", runtime.Version(), runtime.GOOS, runtime.GOARCH)
}
