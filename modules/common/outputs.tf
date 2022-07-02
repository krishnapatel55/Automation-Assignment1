output "log_analytics_workspace" {
  value = azurerm_log_analytics_workspace.log_analytics_workspace.name
}

output "recovery_services_vault" {
  value = azurerm_recovery_services_vault.recovery_services_vault.name
}

output "standard_storage_account" {
  value = azurerm_storage_account.standard_storage_account.name
}

output "storage_account_uri" {
  value = azurerm_storage_account.standard_storage_account.primary_blob_endpoint
}