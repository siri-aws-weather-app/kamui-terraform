variable "role_name" {
  description = "The name of the role"
  type        = string
}

variable "trusted_role_arns" {
  description = "The ARNs of the roles that are trusted by this role"
  type        = list(string)
}

variable "custom_role_policy_arns" {
  description = "The ARNs of the custom policies that are attached to this role"
  type        = list(string)
}

variable "number_of_custom_role_policy_arns" {
  description = "The number of custom policies that are attached to this role"
  type        = number
}