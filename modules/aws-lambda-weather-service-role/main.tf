module "iam_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

  trusted_role_services = var.trusted_role_services

  create_role = true

  role_name         = var.role_name
  role_requires_mfa = true

  custom_role_policy_arns = var.custom_role_policy_arns
  number_of_custom_role_policy_arns = 1
}