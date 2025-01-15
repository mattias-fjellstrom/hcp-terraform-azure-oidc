terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.0.2"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }

    tfe = {
      source  = "hashicorp/tfe"
      version = "0.62.0"
    }
  }
}

provider "azuread" {}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

provider "tfe" {
  organization = var.hcp_terraform_organization
}
