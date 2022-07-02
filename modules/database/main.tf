resource "azurerm_postgresql_server" "databaseserver" {
  name                         = var.server_name
  resource_group_name          = var.rg
  location                     = var.location
  sku_name                     = "B_Gen5_2"
  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  administrator_login          = var.admin_uname
  administrator_login_password = var.admin_password
  version                      = "9.5"
  ssl_enforcement_enabled      = true
  tags                         = local.common_tags
}

resource "azurerm_postgresql_database" "database" {
  name                = "database"
  resource_group_name = var.rg
  server_name         = azurerm_postgresql_server.databaseserver.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
