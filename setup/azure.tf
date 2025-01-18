resource "azuread_application" "hcp_terraform" {
  display_name = var.azuread_application_name
}

resource "azuread_service_principal" "hcp_terraform" {
  client_id = azuread_application.hcp_terraform.client_id
}

data "azurerm_subscription" "current" {}

resource "azurerm_role_definition" "resource_group_creator" {
  name  = "Resource Group Creator"
  scope = data.azurerm_subscription.current.id

  permissions {
    actions = [
      "*/read",
      "Microsoft.Resources/subscriptions/resourceGroups/write",
    ]
  }

  assignable_scopes = [
    data.azurerm_subscription.current.id,
  ]
}

resource "azurerm_role_assignment" "resource_group_creator" {
  scope              = data.azurerm_subscription.current.id
  principal_id       = azuread_service_principal.hcp_terraform.object_id
  role_definition_id = azurerm_role_definition.resource_group_creator.role_definition_resource_id
}

resource "azurerm_role_assignment" "storage_account_contributor" {
  scope                = data.azurerm_subscription.current.id
  principal_id         = azuread_service_principal.hcp_terraform.object_id
  role_definition_name = "Storage Account Contributor"
}

resource "azuread_application_federated_identity_credential" "plan" {
  application_id = azuread_application.hcp_terraform.id
  display_name   = "${azuread_application.hcp_terraform.display_name}-plan"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://app.terraform.io"
  description    = "For HCP Terraform plan operations"
  subject = join(":", [
    "organization",
    data.tfe_organization.current.name,
    "project",
    tfe_project.default.name,
    "workspace",
    tfe_workspace.default.name,
    "run_phase",
    "plan"
  ])
}

resource "azuread_application_federated_identity_credential" "apply" {
  application_id = azuread_application.hcp_terraform.id
  display_name   = "${azuread_application.hcp_terraform.display_name}-apply"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://app.terraform.io"
  description    = "For HCP Terraform apply operations"
  subject = join(":", [
    "organization",
    data.tfe_organization.current.name,
    "project",
    tfe_project.default.name,
    "workspace",
    tfe_workspace.default.name,
    "run_phase",
    "apply"
  ])
}
