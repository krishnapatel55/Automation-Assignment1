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
variable "log_analytics_workspace" {
  type = map(string)
  default = {
    name              = "log-analytics-workspace"
    sku               = "PerGB2018"
    retention_in_days = 30
  }
}
variable "recovery_services_vault" {
  type = map(string)
  default = {
    name = "recovery-services-vault"
    sku  = "Standard"
  }
}
variable "standard_storage_account" {
  type = map(string)
  default = {
    name                     = "1548ssaccount"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
