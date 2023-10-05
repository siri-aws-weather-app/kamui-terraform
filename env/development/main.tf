module ssm-parameters-terraform {
    source = "../../modules/aws-ssm-parameter"
}

module vpc {
  source = "../../modules/aws-vpc"
}