# Set common variables for the environment
locals {
  environment    = "staging"
  state_bucket   = "kamui-terraform-state-staging"
  dynamodb_table = "kamui-terraform-state-lock-staging"
  deps_layer_arn = "arn:aws:lambda:eu-central-1:525284627566:layer:deps-layer:1"
  utils_layer_arn = "arn:aws:lambda:eu-central-1:525284627566:layer:utils-layer:1"
}