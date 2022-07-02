terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01521548RG"
    storage_account_name = "tfstaten01521548sa"
    container_name       = "tfstatefiles"
    key                  = "tfstatekey"
  }
}