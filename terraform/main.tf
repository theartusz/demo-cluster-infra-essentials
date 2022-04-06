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