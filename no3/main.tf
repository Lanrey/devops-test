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

module "vnet" {
    source = "./modules/vnet"
    subnet_address_prefix = ["10.0.3.0/24"]
}

module "aks" {
    source = "./modules/aks"
    subnet_id = module.vnet.subnet_id
}

module "sql" {
    source = "./modules/sql"
    resource_group_name = azurerm_resource_group.default.name
    location = azurerm_resource_group.default.location
    sql_server_name = "mysqlserver-sola-lanre"
    sql_db_name = "mysqldb-sola-lanre"
}

