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

variable "aks_name" {
    type = string
    default = "aksClusterSqlAks"
}

variable "node_count" {
    type = number
    default = 2
  
}

variable "subnet_id" {
    type = string
}