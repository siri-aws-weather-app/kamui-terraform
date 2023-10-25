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
    role_name = "production-role"
    trusted_role_arns = [
      "arn:aws:iam::875944587789:root", 
      "arn:aws:sts::875944587789:assumed-role/AWSReservedSSO_AdministratorAccess_af87dc41a2c468da/admin1"
    ]
    custom_role_policy_arns = [
      "arn:aws:iam::aws:policy/AmazonRoute53FullAccess",
    ]
    number_of_custom_role_policy_arns = 1
}
