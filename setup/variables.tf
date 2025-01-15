variable "azuread_application_name" {
  type        = string
  description = "Azure AD (Entra ID) application name"
  default     = "hcp-terraform-azure-oidc"
}

variable "azure_subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "hcp_terraform_organization" {
  type        = string
  description = "HCP Terraform organization name"
}

variable "hcp_terraform_project" {
  type        = string
  description = "HCP Terraform project name"
  default     = "my-project"
}

variable "hcp_terraform_workspace" {
  type        = string
  description = "HCP Terraform workspace name"
  default     = "my-workspace"
}
