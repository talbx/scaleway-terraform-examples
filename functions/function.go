package example

import (
	"fmt"
	"net/http"
)

func StartFn(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello scaleway function!")
}
