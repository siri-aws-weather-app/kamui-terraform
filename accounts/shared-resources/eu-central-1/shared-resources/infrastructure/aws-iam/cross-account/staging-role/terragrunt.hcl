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
    role_name = "staging-role"
    trusted_role_arns = [
      "arn:aws:iam::525284627566:root", 
      "arn:aws:sts::525284627566:assumed-role/AWSReservedSSO_AdministratorAccess_87c1a7be2f6f8802/admin1"
    ]
    custom_role_policy_arns = [
      "arn:aws:iam::aws:policy/AmazonRoute53FullAccess",
    ]
    number_of_custom_role_policy_arns = 1
}
