variable "location" { 
    type = string
    default = "East US "
  
}

variable "namespace" {
    type = string
    default = "aksClusterSql"
}


variable "resource_group_name" {
    type = string
    default = "aksClusterSql"
}

variable "sql_server_name" {
    type = string
    default = "mysqlserver-sola-lanre"
}

variable "sql_db_name" {
    type = string
    default = "mysqldb-sola-lanre"
}