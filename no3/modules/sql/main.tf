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

resource "random_password" "password" {
  length = 16
  special = true
  override_special = "_%+-."
}

resource "azurerm_sql_server" "sql_server" {
    name = var.sql_server_name
    resource_group_name = azurerm_resource_group.default.name
    location = azurerm_resource_group.default.location
    version = "12.0"
    administrator_login = "sqladmin"
    administrator_login_password = random_password.password.result

    tags = {
        environment = "production"
    }
}

resource "azurerm_sql_database" "sql_db" {
    name = var.sql_db_name
    resource_group_name = azurerm_resource_group.default.name
    location = azurerm_resource_group.default.location
    server_name = azurerm_sql_server.sql_server.name
  
}