resource "random_string" "suffix" {
  length  = 10
  upper   = false
  special = false
}

resource "azurerm_resource_group" "default" {
  name     = "rg-demo-${random_string.suffix.result}"
  location = var.azure_location
}

resource "azurerm_storage_account" "test" {
  name                = "st${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location

  account_tier             = "Standard"
  account_replication_type = "LRS"
}
