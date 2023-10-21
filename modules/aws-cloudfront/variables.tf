variable "domain_name" {
  type        = string
  description = "The domain name to use for the Route53 zone"
}

variable "certificate_arn" {
  type        = string
  description = "The ARN of the certificate to use for the Route53 zone"
}

variable "origin_domain_name" {
  type        = string
  description = "The domain name of the origin to use for the Route53 zone"
}

variable "environment" {
  type        = string
  description = "The environment to use for the Route53 zone"
}

variable "aliases" {
  type        = list(string)
  default     = []
  description = "The aliases to use for the Route53 zone"
}
