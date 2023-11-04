# Kamui Terraform with Terragrunt

Welcome to the `kamui-terraform` repository, where the magic of infrastructure as code materializes through Terraform and Terragrunt. This repository is designed to manage and provision infrastructure resources within AWS, utilizing Terraform for defining resources and Terragrunt for keeping our configurations DRY and maintained.

## Features

- **Terraform and Terragrunt**: Combining these tools allows us to use infrastructure as code to provision AWS resources while maintaining a clean and maintainable codebase.
- **Multi-Account AWS Setup**: Our infrastructure spans multiple AWS accounts under a single organization, ensuring strict isolation of resources and environments.
- **Environment Isolation**: We define four distinct environments:
  - `Development`: Where our new features and ideas come to life.
  - `Staging`: Our pre-production environment, mirroring production as closely as possible.
  - `Production`: The environment that serves our live traffic, where stability and reliability are paramount.
  - `Shared-Resources`: A common ground for resources that need to be accessed across different environments.
  
Each environment is treated as an isolated account to promote security best practices and reduce the risk of cross-environment impact.

## Structure

Our codebase is structured to align with the best practices of both Terraform and Terragrunt usage:

- **Terragrunt Configuration**: Each environment has its own `terragrunt.hcl` file that defines the specifics for that environment and calls the Terraform code.
- **Terraform Modules**: Reusable pieces of code that define a specific piece of our infrastructure.
- **Resource Definitions**: Terraform files that declare the desired state of our AWS resources for each environment.
