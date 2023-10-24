# Set common variables for the environment
locals {
  environment    = "shared-resources"
  state_bucket   = "kamui-terraform-state-shared-resources"
  dynamodb_table = "kamui-terraform-state-lock-shared-resources"
}