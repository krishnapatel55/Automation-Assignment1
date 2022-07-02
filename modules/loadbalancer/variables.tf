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
variable "vmlinuxnic" {
  type = list(any)
}
variable "nb_count" {
  default = 2
}
variable "vmlinux" {
  default = "vmlinux"
}
