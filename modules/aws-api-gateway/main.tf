module "api_gateway" {
  source = "terraform-aws-modules/apigateway-v2/aws"

  name          = var.name
  description   = var.description
  protocol_type = "HTTP"

  cors_configuration = {
    allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    allow_methods = var.allow_methods
    allow_origins = var.allow_origins
  }

  # Custom domain
  domain_name                 = var.domain_name
  domain_name_certificate_arn = var.domain_name_certificate_arn

  # Routes and integrations
  integrations = var.integrations

  tags = {
    Name = "http-apigateway"
  }
}