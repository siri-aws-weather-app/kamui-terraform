module "app_runner_shared_configs" {
  source = "terraform-aws-modules/app-runner/aws"

  # Disable service resources as this is shared configuration
  create_service = false

  auto_scaling_configurations = {
    mini = {
      name            = "mini"
      max_concurrency = 20
      max_size        = 5
      min_size        = 0

      tags = {
        Type = "Mini"
      }
    }
  }
}