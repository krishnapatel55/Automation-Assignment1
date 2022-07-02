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
variable "vmlinux_avs" {
  type = map(string)
  default = {
    name          = "1548-linux-avs"
    update_domain = 10
    fault_domain  = 2
  }
}
variable "subnet_id" {
  default = ""
}
variable "vmlinux_name" {
  default = "vmlinux"
}
variable "size" {
  default = "Standard_B1ms"
}
variable "admin_uname" {
  default = "krishna-n01521548"
}
variable "admin_password" {
  default = "k@541192"
}
variable "os_disk" {
  type = map(string)
  default = {
    storage_account_type = "Premium_LRS"
    disk_size            = 32
    caching              = "ReadWrite"
  }
}
variable "linux_os" {
  type = map(string)
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
}
variable "vmext" {
  type = map(string)
  default = {
    publisher            = "Microsoft.Azure.NetworkWatcher"
    type                 = "NetworkWatcherAgentLinux"
    type_handler_version = "1.4"
  }
}
variable "storage_account_uri" {
  type = string
}