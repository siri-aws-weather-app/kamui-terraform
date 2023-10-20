variable "github_thumbprint" {
    description = "The thumbprint of Github"
    type        = string
}

variable "repositories" {
    description = "The list of repositories to clone"
    type        = list(string)
}

variable "oidc_role_attach_policies" {
    description = "The list of policies to attach to the OIDC role"
    type        = list(string)
}

variable "role_name" {
    description = "The name of the role"
    type        = string
}

variable "role_description" {
    description = "The description of the role"
    type        = string
}