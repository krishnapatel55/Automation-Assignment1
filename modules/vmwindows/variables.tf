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
variable "subnet_id" {
  default = ""
}
variable "vmwindows_name" {
  default = "vmwinsn01521548"
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
    create_option        = "Attach"
    storage_account_type = "StandardSSD_LRS"
    disk_size            = 128
    caching              = "ReadWrite"
  }
}
variable "windows_os" {
  type = map(string)
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
variable "vmwindows_avs" {
  type = map(string)
  default = {
    name          = "1548-windows-avs"
    update_domain = 10
    fault_domain  = 2
  }
}
variable "storage_account_uri" {
  type = string
}
variable "wvmext" {
  type = map(string)
  default = {
    publisher            = "Microsoft.Azure.Security.AntimalwareSignature"
    type                 = "AntimalwareConfiguration"
    type_handler_version = "2.58"
  }
}
