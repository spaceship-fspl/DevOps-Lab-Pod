package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
)

func handler(w http.ResponseWriter, r *http.Request) {
	loc := time.FixedZone("Est/EST", -5 * 60 * 60)
	now := time.Now().In(loc)
	fmt.Fprintf(w, "Please submit a screen shot of this page with your solution %s! %v", r.URL.Path[1:], now)
}

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}
