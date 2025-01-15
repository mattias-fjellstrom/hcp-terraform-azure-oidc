# Access Azure from HCP Terraform with OIDC federation

## Prerequisites

* Install the Azure CLI (see [instructions](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)) and run `az login` and follow the instructions.
* Install Terraform CLI (see [instructions](https://developer.hashicorp.com/terraform/install)) and run `terraform login` and follow the instructions.

## Setup the trust relationship

To set up the required resources on Azure, Azure AD (Entra ID) and HCP Terraform:

1. Go to the [setup](./setup/) directory.
1. Rename the file [terraform.tfvars.example](./setup/terraform.tfvars.example) to `terraform.tfvars` and edit the content of the file with your values.
1. Run `terraform init`, `terraform plan` and `terraform apply`.

## Use the trust relationship

To use the OIDC federation:

1. Go to the [use](./use/) directory.
1. Rename the file [terraform.tfvars.example](./use/terraform.tfvars.example) to `terraform.tfvars` and edit the content of the file with your values.
1. Open [terraform.tf](./use/terraform.tf) and edit the `cloud` block with your values.
1. Run `terraform init`, `terraform plan` and `terraform apply`.