# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-iam/assumable-roles/cross-account-role/"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
    role_name = "development-role"
    trusted_role_arns = [
      "arn:aws:iam::360532638835:root", 
      "arn:aws:sts::360532638835:assumed-role/AWSReservedSSO_AdministratorAccess_265a4aa76729ba37/admin1"
    ]
    custom_role_policy_arns = [
      "arn:aws:iam::aws:policy/AmazonRoute53FullAccess",
    ]
    number_of_custom_role_policy_arns = 2
}
