output "layer_arn" {
  description = "The ARN of the App Runner auto scaling configuration version."
  value       = module.lambda_layer_s3.lambda_layer_arn
}