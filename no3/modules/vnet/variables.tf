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

variable "vnet_name" {
    type = string
    default = "aksVNet"
}

variable "vnet_address_space" {
  type = list(string)
  default = ["10.0.0.0/16"]  // Example CIDR block
}


variable "subnet_name" {
    type = string
    default = "aksSubNetName"
}

variable "subnet_address_prefix" {
    type = list(string)
    default = ["10.0.3.0/24"]
}
