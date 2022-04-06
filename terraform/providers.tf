terraform {
  required_providers {
    // Add version constraint to providers to avoid automatic
    // upgrades resulting in breaking changes.
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.98.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.azure.subscription_id
}
