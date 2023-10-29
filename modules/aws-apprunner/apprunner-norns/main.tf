module "app_runner_image_base" {
  source = "terraform-aws-modules/app-runner/aws"

  service_name = var.service_name

  create_custom_domain_association = var.create_custom_domain_association
  domain_name                      = var.domain_name

  # From shared configs
  auto_scaling_configuration_arn = var.auto_scaling_configuration_arn

  instance_iam_role_name        = "apprunner-norns-instance-role"
  instance_iam_role_description = "IAM role to read from DynamoDb"
  instance_iam_role_policies = {
    "DynamoDbPolicy" = "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess",
  }

  create_access_iam_role      = true
  access_iam_role_name        = "apprunner-norns-access-role"
  access_iam_role_description = "IAM role to pull from ECR"
  access_iam_role_policies = {
    "ECRPolicy" = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
  }

  source_configuration = {
    auto_deployments_enabled     = false
    authentication_configuration = {}
    image_repository = {
      image_configuration = {
        port = 3000
      }
      image_identifier      = var.image_identifier
      image_repository_type = "ECR"
    }
  }

  enable_observability_configuration = true

  tags = {
    Terraform = "true"
  }
}
