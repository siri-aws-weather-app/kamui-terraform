# Set common variables for the environment
locals {
  environment    = "shared-resources"
  state_bucket   = "kamui-terraform-state-development-us-east-1"
  dynamodb_table = "kamui-terraform-state-lock-development-us-east-1"
}