resource "azurerm_resource_group" "k8s_resource_group" {
  name     = var.azure.resource_group_name
  location = var.azure.location
  tags     = var.tags
}

resource "azurerm_dns_zone" "dns_zone" {
  name                = var.azure.dns_zone_name
  resource_group_name = azurerm_resource_group.k8s_resource_group.name
  tags                = var.tags

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.azure.public_ip_name
  resource_group_name = azurerm_resource_group.k8s_resource_group.name
  location            = var.azure.location
  allocation_method   = "Static"
  sku                 = "Basic"
  tags                = var.tags

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.azure.storage_account
  resource_group_name      = azurerm_resource_group.k8s_resource_group.name
  location                 = var.azure.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

resource "azurerm_storage_container" "essentials" {
  name                  = var.azure.storage_container_essentials
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "magnifik" {
  name                  = var.azure.storage_container_magnifik
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

#resource "azurerm_storage_container" "test" {
#  name                  = "ping"
#  storage_account_name  = azurerm_storage_account.storage_account.name
#  container_access_type = "private"
#}
