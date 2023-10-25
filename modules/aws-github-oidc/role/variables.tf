variable "create_oidc_role" {
  description = "Whether or not to create the OIDC attached role"
  type        = bool
  default     = true
}

variable "github_thumbprint" {
  description = "GitHub OpenID TLS certificate thumbprint."
  type        = string
  default     = "6938fd4d98bab03faadb97b34396831e3780aea1"
}

variable "repositories" {
  description = "List of GitHub organization/repository names authorized to assume the role."
  type        = list(string)
  default     = []

  validation {
    # Ensures each element of github_repositories list matches the
    # organization/repository format used by GitHub.
    condition = length([
      for repo in var.repositories : 1
      if length(regexall("^[A-Za-z0-9_.-]+?/([A-Za-z0-9_.:/-]+|\\*)$", repo)) > 0
    ]) == length(var.repositories)
    error_message = "Repositories must be specified in the organization/repository format."
  }
}

variable "max_session_duration" {
  description = "Maximum session duration in seconds."
  type        = number
  default     = 3600

  validation {
    condition     = var.max_session_duration >= 3600 && var.max_session_duration <= 43200
    error_message = "Maximum session duration must be between 3600 and 43200 seconds."
  }
}

variable "oidc_role_attach_policies" {
  description = "Attach policies to OIDC role."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "role_name" {
  description = "(Optional, Forces new resource) Friendly name of the role."
  type        = string
  default     = "github-oidc-provider-aws"
}

variable "role_description" {
  description = "(Optional) Description of the role."
  type        = string
  default     = "Role assumed by the GitHub OIDC provider."
}

variable "oidc_provider_arn" {
  description = "ARN of the OIDC provider."
  type        = string
}