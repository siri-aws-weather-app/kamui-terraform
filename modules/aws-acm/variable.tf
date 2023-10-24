variable "role_arn" {
  type        = string
  default     = ""
  description = "The name of the role to assume for the Route53 validation"
}

variable "domain_name" {
  type        = string
  description = "The domain name to use for the Route53 zone"
}

variable "zone_id" {
  type        = string
  default     = ""
  description = "The Route53 zone ID to use for the domain"
}

variable "subject_alternative_names" {
  default     = []
  type        = list(string)
  description = "A list of subject alternative names (SANs) to use for the certificate"
}

variable "environment" {
  type        = string
  description = "The environment"
}