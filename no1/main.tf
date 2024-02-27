provider "azurerm" {
    features {
    }
}

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

resource "azurerm_storage_account" "helm" {
    name = "helmstorageaccountsola"
    resource_group_name = azurerm_resource_group.default.name
    location = azurerm_resource_group.default.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "helm" {
    name = "helmcharts"
    storage_account_name = azurerm_storage_account.helm.name
    container_access_type = "blob"
}

data "azurerm_storage_account_sas" "storage_sas" {
    connection_string = azurerm_storage_account.helm.primary_connection_string

    resource_types {
      service = false
      container = false
      object = true
    }

    services {
      blob = true
      queue = false
      table = false
      file = false
    }

    start = "2023-02-26T00:00:00Z"
    expiry = "2048-06-19T00:00:00Z"

    permissions {
        read = true
        write = true
        delete = false
        list = false
        add = false
        create = false
        update = false
        process = false
        tag = false
        filter = false
    }
}