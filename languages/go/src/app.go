package main

import (
	"fmt"

	"github.com/anunca/demo/go/hello"
)

func main() {
	var name string

	fmt.Print("name:\t")
	// TODO force scan in container
	fmt.Scan(&name)

	hello.PrintHello(name)
}
