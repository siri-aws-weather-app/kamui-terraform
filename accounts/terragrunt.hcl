locals {
    # Load account, region and environment variables
    account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
    region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
    environment_vars  = read_terragrunt_config(find_in_parent_folders("env.hcl"))

    # This is where the loaded variables are extracted for the backend configuration
    aws_region = local.region_vars.locals.aws_region
    environment     = local.environment_vars.locals.environment
    state_bucket    = local.environment_vars.locals.state_bucket
    dynamodb_table  = local.environment_vars.locals.dynamodb_table

    # Environment specific variables
    deps_layer_arn = local.environment_vars.locals.deps_layer_arn
    utils_layer_arn = local.environment_vars.locals.utils_layer_arn
    lambda_get_realtime_weather_arn = local.environment_vars.locals.lambda_get_realtime_weather_arn
}

remote_state {
    backend = "s3"
    generate = {
        path      = "backend.tf"
        if_exists = "overwrite"
    }
    config = {
        bucket         = "${local.state_bucket}"
        key            = "${path_relative_to_include()}/terraform.tfstate"
        region         = "${local.aws_region}"
        encrypt        = true
        dynamodb_table = "${local.dynamodb_table}"
    }
}

inputs = merge(
  local.account_vars.locals,
  local.region_vars.locals,
  local.environment_vars.locals,
)