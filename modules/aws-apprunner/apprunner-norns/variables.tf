variable "service_name" {
    description = "The name of the service"
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