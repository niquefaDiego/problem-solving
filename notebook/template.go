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

func main() {
  var ntc int
  fmt.Fscan(in, &ntc)
  for t := 0; t < ntc; t++ {

  }
  out.Flush()
}
