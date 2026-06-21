package hello

import (
	"fmt"

	"github.com/anunca/demo/go/user"
)

func PrintHello(name string) {
	user := user.New(name)

	hello := "Hello:\t" + user.Name

	fmt.Println(hello)
}
