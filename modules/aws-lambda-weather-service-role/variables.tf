variable "trusted_role_services" {
    description = "List of trusted role services"
    type        = list(string)
    default     = []
}

variable "role_name" {
    description = "Name of the role"
    type        = string
    default     = "lambda-role"
}

variable "custom_role_policy_arns" {
    description = "List of custom role policy ARNs"
    type        = list(string)
    default     = []
}