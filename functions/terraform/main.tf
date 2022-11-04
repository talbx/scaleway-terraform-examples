resource "scaleway_function" "uuid-generator" {
  name         = "scaleway-example-fns"
  namespace_id = scaleway_function_namespace.ns.id
  runtime      = "go118"
  handler      = "Handle"
  privacy      = "public"
  zip_file     = "uuid-fn.zip"
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
