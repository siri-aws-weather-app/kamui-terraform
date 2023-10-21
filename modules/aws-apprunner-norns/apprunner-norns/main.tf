module "app_runner_image_base" {
  source = "terraform-aws-modules/app-runner/aws"

  service_name = var.service_name

  # From shared configs
  auto_scaling_configuration_arn = var.auto_scaling_configuration_arn

  source_configuration = {
    auto_deployments_enabled = false
    image_repository = {
      image_configuration = {
        port = 8000
      }
      image_identifier      = var.image_identifier
      image_repository_type = "ECR_PRIVATE"
    }
  }

  enable_observability_configuration = true

  tags = {
    Terraform   = "true"
  }
}
