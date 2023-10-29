variable "service_name" {
  description = "The name of the service"
  type        = string
}

variable "create_custom_domain_association" {
  default     = false
  description = "Create a custom domain association"
  type        = bool
}

variable "domain_name" {
  default     = ""
  description = "The domain name"
  type        = string
}

variable "auto_scaling_configuration_arn" {
  description = "The ARN of the auto scaling configuration"
  type        = string
}

variable "image_identifier" {
  description = "The image identifier"
  type        = string
}