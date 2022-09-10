# scaleway-terraform-examples

## Deploying a Go Serverless Function Using Terraform

### Quick start
`functions/function.go` is a simple go program which will print out hello world once invoked. To deploy it to scaleway do the following:

1. Run 
```bash
zip -r example-fn.zip function.go go.mod
```
in `functions/` directory. This will create the source code archive which will used by scaleway.

2. Provide a `terraform.tfvars` file in the `functions/` directory containing your secrets and environment variables like so:
```properties
zone       = "fr-par-1"
region     = "fr-par"
env        = "dev"
project_id = "<my-project-id>"
secret_key = "<my-secret-key>"
access_key = "<my-access-key>"
```
3. Provision the function and its namespace via `terraform plan` and `terraform apply`. 
4. Invoke the function via the function endpoint, which is displayed in your function settings / endpoints tab in the scaleway UI. 

### Notes
Once you finished the quick start, you might want to put your own program into the cloud. What is important is that your program entrypoint is not the Go `main()` function. Instead, you'll need to put your entrypoint inside a different package, other than `package main`. The entrypoint function needs to be exported (i.e. uppercase). The entrypoint function name is your handler. The handler must be defined in order to make your program compileable once its pushed onto the scaleway infrastructure. Therefore, when your program entrypoint is

```go
func MyVeryOwnProgramEntrypoint(w http.ResponseWriter, r *http.Request) {
	// my program code 
}
```

you need to specify the exact fn name in the `scaleway_function` resource.

```properties
resource "scaleway_function" "main" {
  name         = "scaleway-example-fn"
  handler      = "MyVeryOwnProgramEntrypoint" 
  ...
}
```

Your full entrypoint go file should look like this:

`myprogram.go`
```go
package example

import (
	"fmt"
	"net/http"
)

func MyVeryOwnProgramEntrypoint(w http.ResponseWriter, r *http.Request) {
	// my program code 
}
```