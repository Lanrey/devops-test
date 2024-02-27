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

resource "azurerm_kubernetes_cluster" "aks" {
    name = var.aks_name
    location = azurerm_resource_group.default.location
    resource_group_name =  azurerm_resource_group.default.name
    dns_prefix = "${var.aks_name}-dns"

    default_node_pool {
      name = "default"
      node_count = var.node_count
      vm_size = "Standard_DS2_v2"
    }

    identity {
      type = "SystemAssigned"
    }
  
}