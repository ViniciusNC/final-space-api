package main

import (
	"net/http"
)

func main() {
	fs := http.FileServer(http.Dir("static"))
	http.Handle("/static/", http.StripPrefix("/static/", fs))

	// Manipulador para a raiz ("/") que serve o arquivo index.html
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		http.ServeFile(w, r, "static/index.html")
	})

	// Inicia o servidor na porta 5000
	if err := http.ListenAndServe(":5000", nil); err != nil {
		panic(err)
	}
}
