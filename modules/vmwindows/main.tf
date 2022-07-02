resource "azurerm_availability_set" "vmwindows_avs" {
  name                         = var.vmwindows_avs["name"]
  location                     = var.location
  resource_group_name          = var.rg
  platform_update_domain_count = var.vmwindows_avs["update_domain"]
  platform_fault_domain_count  = var.vmwindows_avs["fault_domain"]
}

resource "azurerm_network_interface" "nic2" {
  name                = "${var.vmwindows_name}-nic"
  location            = var.location
  resource_group_name = var.rg
  tags                = local.common_tags

  ip_configuration {
    name                          = "${var.vmwindows_name}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip2.id
  }
}

resource "azurerm_public_ip" "pip2" {
  name                = "${var.vmwindows_name}-pip"
  resource_group_name = var.rg
  location            = var.location
  domain_name_label   = "${var.vmwindows_name}-dns"
  allocation_method   = "Static"
  tags                = local.common_tags
}

resource "azurerm_windows_virtual_machine" "vmwindows" {
  name                = "${var.vmwindows_name}-vm"
  resource_group_name = var.rg
  location            = var.location
  size                = var.size
  admin_username      = var.admin_uname
  admin_password      = var.admin_password
  computer_name       = var.vmwindows_name
  availability_set_id = azurerm_availability_set.vmwindows_avs.id
  tags                = local.common_tags

  network_interface_ids = [
    azurerm_network_interface.nic2.id
  ]

  os_disk {
    name                 = "${var.vmwindows_name}-os-disk"
    caching              = var.os_disk["caching"]
    storage_account_type = var.os_disk["storage_account_type"]
    disk_size_gb         = var.os_disk["disk_size"]
  }

  source_image_reference {
    publisher = var.windows_os["publisher"]
    offer     = var.windows_os["offer"]
    sku       = var.windows_os["sku"]
    version   = var.windows_os["version"]
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  depends_on = [azurerm_availability_set.vmwindows_avs]
}

resource "azurerm_virtual_machine_extension" "vmwindowsext" {
  name                 = "${var.vmwindows_name}-vmext"
  virtual_machine_id   = azurerm_windows_virtual_machine.vmwindows.id
  publisher            = var.wvmext["publisher"]
  type                 = var.wvmext["type"]
  type_handler_version = var.wvmext["type_handler_version"]
  tags                 = local.common_tags
}
