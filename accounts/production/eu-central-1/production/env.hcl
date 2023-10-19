# Set common variables for the environment
locals {
  environment    = "production"
  state_bucket   = "kamui-terraform-state-production"
  dynamodb_table = "kamui-terraform-state-lock-production"
  deps_layer_arn = "arn:aws:lambda:eu-central-1:875944587789:layer:deps-layer:1"
  utils_layer_arn = "arn:aws:lambda:eu-central-1:875944587789:layer:utils-layer:1"
}