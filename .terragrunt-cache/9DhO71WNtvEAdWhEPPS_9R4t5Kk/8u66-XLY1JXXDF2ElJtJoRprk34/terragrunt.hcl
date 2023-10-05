inputs = {
  region = "eu-central-1"
}

terraform {
    source = "./modules/aws-ssm-parameter"
}