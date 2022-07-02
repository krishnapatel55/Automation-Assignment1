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
variable "admin_uname" {
  default = "krishna"
}
variable "admin_password" {
  default = "k@541192"
}
variable "server_name" {
  default = "1548-db-server"
}
