locals {
  common_tags = {
    Project        = "Automation Project - Assignment 1"
    Name           = "Krishna.Patel"
    ExpirationDate = "2022-06-30"
    Enviroment     = "Lab"
  }
}
variable "rg" {
  default = ""
}
variable "location" {
  default = ""
}
variable "vnet" {
  default = "network-vnet"
}
variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}
variable "subnet" {
  default = "network-vnet-subnet"
}
variable "subnet_address_space" {
  default = ["10.0.1.0/24"]
}