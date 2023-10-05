# Set common variables for the environment
locals {
  environment    = "staging"
  state_bucket   = "kamui-terraform-state-staging"
  dynamodb_table = "kamui-terraform-state-lock-staging"
}