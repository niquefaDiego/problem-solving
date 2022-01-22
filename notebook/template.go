package main

import (
	"bufio"
	"fmt"
	"os"
)

var (
	in  = bufio.NewReader(os.Stdin)
	out = bufio.NewWriter(os.Stdout)
)

func scan(a ...interface{})             { fmt.Fscan(in, a...) }
func printf(f string, a ...interface{}) { fmt.Fprintf(out, f, a...) }

func main() {
	defer out.Flush()

	var ntc int
	fmt.Fscan(in, &ntc)
	for t := 0; t < ntc; t++ {

	}
}
