data "tfe_organization" "current" {}

resource "tfe_project" "default" {
  name        = var.hcp_terraform_project
  description = "Project for demo workspace"
}

resource "tfe_workspace" "default" {
  name        = var.hcp_terraform_workspace
  description = "Workspace for OIDC auth test"
  project_id  = tfe_project.default.id
}

resource "tfe_variable_set" "azure" {
  name = "AZURE_OIDC"
}

resource "tfe_variable" "tfc_azure_run_client_id" {
  key             = "TFC_AZURE_RUN_CLIENT_ID"
  value           = azuread_service_principal.hcp_terraform.client_id
  description     = "Azure service principal client ID"
  category        = "env"
  variable_set_id = tfe_variable_set.azure.id
}

resource "tfe_variable" "tfc_azure_provider_auth" {
  key             = "TFC_AZURE_PROVIDER_AUTH"
  value           = "true"
  category        = "env"
  variable_set_id = tfe_variable_set.azure.id
}

resource "tfe_workspace_variable_set" "azure" {
  variable_set_id = tfe_variable_set.azure.id
  workspace_id    = tfe_workspace.default.id
}
