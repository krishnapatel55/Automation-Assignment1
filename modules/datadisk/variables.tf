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
variable "nb_count" {
  default = 2
}
variable "vmlinux_id" {
  type = list(string)
}
variable "vmwindows_id" {
  type = string
}
variable "windows_dd_name" {
  default = "windows-datadisk"
}
variable "linux_dd_name" {
  default = "linux-datadisk"
}
variable "storage_account_type" {
  default = "Standard_LRS"
}
variable "create_option" {
  default = "Empty"
}
variable "disk_size_gb" {
  default = 10
}
variable "lun" {
  default = 0
}
variable "data_disk_caching" {
  default = "ReadWrite"
}
