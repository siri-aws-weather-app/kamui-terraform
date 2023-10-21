provider "aws" {
  alias  = "acm"
  region = "us-east-1"
}

# Assumed role in shared-resources account
provider "aws" {
  alias  = "route53"
  region = "us-east-1"

  assume_role {
    role_arn = var.role_arn
  }
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  providers = {
    aws = aws.acm
  }

  domain_name = var.domain_name
  zone_id     = var.zone_id

  validation_method = "DNS"

  subject_alternative_names = var.subject_alternative_names

  wait_for_validation = false

  create_route53_records  = false

  tags = {
    Name = var.domain_name
  }
}

module "route53_records" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  providers = {
    aws = aws.route53
  }

  create_certificate          = false
  create_route53_records_only = true

  validation_method = "DNS"

  distinct_domain_names = module.acm.distinct_domain_names
  zone_id               = var.zone_id

  acm_certificate_domain_validation_options = module.acm.acm_certificate_domain_validation_options
}