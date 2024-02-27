resource "azurerm_resource_group" "default" {
    name = local.namespace
    location = var.location
}

resource "random_string" "rand" {
    length = 24
    special = false
    upper = false
}

locals {
    namespace = substr(join("-", [var.namespace, random_string.rand.result]), 0, 24)
}

resource "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
    address_space = var.vnet_address_space
    location = azurerm_resource_group.default.location
    resource_group_name = azurerm_resource_group.default.name
  
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefix
}