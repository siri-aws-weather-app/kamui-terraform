# Set common variables for the environment
locals {
  environment    = "production"
  state_bucket   = "kamui-terraform-state-production"
  dynamodb_table = "kamui-terraform-state-lock-production"
}