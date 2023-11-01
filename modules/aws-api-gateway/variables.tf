variable "name" {
  type        = string
  description = "The name of the resource"
}

variable "description" {
  type        = string
  description = "The description of the resource"
}

variable "allow_methods" {
  type        = list(string)
  description = "The allowed methods of the resource"
}

variable "allow_origins" {
  type        = list(string)
  description = "The allowed origins of the resource"
}

variable "domain_name" {
  type        = string
  description = "The domain name of the resource"
}

variable "domain_name_certificate_arn" {
  type        = string
  description = "The domain name certificate arn of the resource"
}

variable "integrations" {
  type        = map(any)
  description = "The integrations of the resource"
}