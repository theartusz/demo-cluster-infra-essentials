terraform {
  backend "azurerm" {
    resource_group_name  = "magnifik-essentials"
    storage_account_name = "magnifikterraformbackend"
    container_name       = "essentials"
    key                  = "prod.terraform.tfstate"
  }
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
