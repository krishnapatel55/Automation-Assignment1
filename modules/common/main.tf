resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = var.log_analytics_workspace["name"]
  location            = var.location
  resource_group_name = var.rg
  sku                 = var.log_analytics_workspace["sku"]
  retention_in_days   = var.log_analytics_workspace["retention_in_days"]
  tags                = local.common_tags
}

resource "azurerm_recovery_services_vault" "recovery_services_vault" {
  name                = var.recovery_services_vault["name"]
  location            = var.location
  resource_group_name = var.rg
  sku                 = var.recovery_services_vault["sku"]
  soft_delete_enabled = true
  tags                = local.common_tags
}

resource "azurerm_storage_account" "standard_storage_account" {
  name                     = var.standard_storage_account["name"]
  location                 = var.location
  resource_group_name      = var.rg
  account_tier             = var.standard_storage_account["account_tier"]
  account_replication_type = var.standard_storage_account["account_replication_type"]
  tags                     = local.common_tags
}
