variable "function_name" {
    description = "The name of the function"
    type        = string
}

variable "function_description" {
    description = "The description of the function"
    type        = string
}
variable "source_path" {
    description = "The source path of the function"
    type        = string
}
variable "s3_bucket" {
    description = "The s3_bucket of the function"
    type        = string
}

variable "environment" {
  description = "The environment tag."
  type        = string
}

variable "runtime" {
  description = "Runtime for the function."
  type        = string
}

variable "handler" {
  description = "Handler for the function."
  type        = string
}

variable "deps_layer_arn" {
  description = "Deps layer ARN for the function."
  type        = string
}

variable "utils_layer_arn" {
  description = "Utils layer ARN for the function."
  type        = string
}

variable "policies" {
  description = "Policies for the function."
  type        = list(string)
}

variable "number_of_policies" {
  description = "Number of policies for the function."
  type        = number
}

variable "environment_variables" {
  description = "Environment variables that should be avaialbel inside the function."
  type        = map(string)
  default     = {}
}

variable "weather_api_key_secret_arn" {
  description = "Weather API key ARN for the secret."
  type        = string
  default     = null
}

variable "lambda_environment_variables" {
  description = "Environ variables for the lambda function."
  type        = map(string)
  default     = {}
}