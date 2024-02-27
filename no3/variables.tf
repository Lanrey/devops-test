variable "location" { 
    type = string
    default = "East US "
  
}

variable "namespace" {
    type = string
    default = "aksClusterSql"
}

variable "vnet_name" {
    type = string
    default = "aksVNet"
}

variable "subnet_name" {
    type = string
    default = "aksSubNetName"
}

variable "aks_name" {
    type = string
    default = "aksClusterSqlAks"
}