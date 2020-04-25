package main

import (
	"time"
	"os"
	"fmt"
	"net/http"
	"log"
)

func getCurrenTime() string {

	currentTime := time.Now()

	return currentTime.String()
}

func getHostname() string {

	hostname, err := os.Hostname()

	if err != nil {
		return "<span style=\"color:red\">there is an error</span>"
	} else {
		return hostname
	}
}

func handler(w http.ResponseWriter, r *http.Request) {

	currentTime := getCurrenTime()
	hostname := getHostname()

	w.Header().Set("Content-Type", "text/html; charset=utf-8")

	fmt.Fprintf(w, "<h1>Golang</h1>")
	fmt.Fprintf(w, "<p>Time: %s</p>", currentTime)
    fmt.Fprintf(w, "<p>Hostname: %s</p>", hostname)
}

func main() {

	http.HandleFunc("/", handler)

	log.Fatal(http.ListenAndServe(":80", nil))
}
