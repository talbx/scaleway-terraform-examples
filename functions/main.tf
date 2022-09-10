resource "scaleway_function" "main" {
  name         = "scaleway-example-fn"
  namespace_id = scaleway_function_namespace.ns.id
  runtime      = "go118"
  handler      = "StartFn"
  privacy      = "public"
  zip_file     = "example-fn.zip"
  min_scale = 1
  max_scale = 1
  memory_limit = 128
  description = "an example function"
  deploy = true
}

resource "scaleway_function_namespace" "ns" {
  name        = "scaleway-terraform-examples"
  description = "scaleway-terraform-examples"
}
