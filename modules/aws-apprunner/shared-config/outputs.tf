output "auto_scaling_configuration_arn" {
  description = "The ARN of the App Runner auto scaling configuration version."
  value       = module.app_runner_shared_configs.auto_scaling_configurations.mini.arn
}