resource "azurerm_managed_disk" "linux_datadisk" {
  count                = var.nb_count
  name                 = "${var.linux_dd_name}-dd-${format("%1d", count.index + 1)}"
  resource_group_name  = var.rg
  location             = var.location
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  tags                 = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "linux_data_disk_attach" {
  count              = var.nb_count
  managed_disk_id    = element(azurerm_managed_disk.linux_datadisk[*].id, count.index + 1)
  virtual_machine_id = var.vmlinux_id[count.index]
  lun                = var.lun
  caching            = var.data_disk_caching
  depends_on         = [azurerm_managed_disk.linux_datadisk]
}

resource "azurerm_managed_disk" "windows_datadisk" {
  name                 = var.windows_dd_name
  resource_group_name  = var.rg
  location             = var.location
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  tags                 = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "windows_data_disk_attach" {
  managed_disk_id    = azurerm_managed_disk.windows_datadisk.id
  virtual_machine_id = var.vmwindows_id
  lun                = var.lun
  caching            = var.data_disk_caching
  depends_on         = [azurerm_managed_disk.windows_datadisk]
}
