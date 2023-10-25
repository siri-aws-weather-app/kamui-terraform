output "oidc_provider_arn" {
  value       = module.github_oidc_provider.oidc_provider_arn
  description = "The ARN of the OIDC provider"
}