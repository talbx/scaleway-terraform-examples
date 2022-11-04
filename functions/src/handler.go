package handler

import (
	"fmt"
	"net/http"
	"time"

	"github.com/talbx/scw-fn/int"
)

func Handle(w http.ResponseWriter, r *http.Request) {
	uuid := int.GenerateUuid()
	timestamp := time.Now().Local().String()
	w.Header().Set("Content-Type", "application/json")
	print := fmt.Sprintf("some fancy uuid: %s at time %s", uuid, timestamp)
	fmt.Fprint(w, print)
}
