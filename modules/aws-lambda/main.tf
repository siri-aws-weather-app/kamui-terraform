module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = var.function_name
  description   = var.function_description
  handler       = var.handler
  runtime       = var.runtime
  publish       = true
  architectures = ["x86_64"]
  memory_size	  = 512

  attach_policies	= true
  number_of_policies	= var.number_of_policies

  source_path = var.source_path

  store_on_s3 = true
  s3_bucket   = var.s3_bucket

  policies		= var.policies
  layers = [
    var.deps_layer_arn,
    var.utils_layer_arn
  ]

  # merge environment variables with the weather api key if secret arn is provided
  environment_variables	= merge(
    var.environment_variables,
    {
      "WEATHER_API_KEY" = lookup(
        jsondecode(
          coalesce(
            try(data.aws_secretsmanager_secret_version.weather_api_key_version[0].secret_string, null), "{}"
            )
          ), "WEATHER_API_KEY", ""
        )
    }
  )

  tags = {
        Terraform   = "true"
        Environment = var.environment  
  }
}

# get the latest version of the weather api key if secret arn is provided
data "aws_secretsmanager_secret_version" "weather_api_key_version" {
  count = var.weather_api_key_secret_arn != null ? 1 : 0

  secret_id = var.weather_api_key_secret_arn
  version_stage = "AWSCURRENT"
}