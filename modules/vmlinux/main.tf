resource "azurerm_availability_set" "vmlinux_avs" {
  name                         = var.vmlinux_avs["name"]
  location                     = var.location
  resource_group_name          = var.rg
  platform_update_domain_count = var.vmlinux_avs["update_domain"]
  platform_fault_domain_count  = var.vmlinux_avs["fault_domain"]
  tags                         = local.common_tags
}

resource "azurerm_network_interface" "nic" {
  count               = var.nb_count
  name                = "${var.vmlinux_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg
  tags                = local.common_tags

  ip_configuration {
    name                          = "${var.vmlinux_name}-ipconfig-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.pip[*].id, count.index + 1)
  }
}

resource "azurerm_public_ip" "pip" {
  count               = var.nb_count
  name                = "${var.vmlinux_name}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.rg
  location            = var.location
  domain_name_label   = "${var.vmlinux_name}-dns-${format("%1d", count.index + 1)}"
  allocation_method   = "Static"
  tags                = local.common_tags
}

resource "azurerm_linux_virtual_machine" "vmlinux" {
  count                           = var.nb_count
  name                            = "${var.vmlinux_name}-vm-${format("%1d", count.index + 1)}"
  resource_group_name             = var.rg
  location                        = var.location
  size                            = var.size
  computer_name                   = "${var.vmlinux_name}-cn-${format("%1d", count.index + 1)}"
  admin_username                  = var.admin_uname
  admin_password                  = var.admin_password
  disable_password_authentication = false
  tags                            = local.common_tags

  availability_set_id = azurerm_availability_set.vmlinux_avs.id
  network_interface_ids = [
    element(azurerm_network_interface.nic[*].id, count.index + 1)
  ]

  os_disk {
    name                 = "${var.vmlinux_name}-os-disk-${format("%1d", count.index + 1)}"
    caching              = var.os_disk["caching"]
    storage_account_type = var.os_disk["storage_account_type"]
    disk_size_gb         = var.os_disk["disk_size"]
  }

  source_image_reference {
    publisher = var.linux_os["publisher"]
    offer     = var.linux_os["offer"]
    sku       = var.linux_os["sku"]
    version   = var.linux_os["version"]
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  depends_on = [azurerm_availability_set.vmlinux_avs]
}

resource "azurerm_virtual_machine_extension" "vmlinuxext" {
  count                = var.nb_count
  name                 = "${var.vmlinux_name}-vmext-${format("%1d", count.index + 1)}"
  virtual_machine_id   = azurerm_linux_virtual_machine.vmlinux[count.index].id
  type                 = var.vmext["type"]
  type_handler_version = var.vmext["type_handler_version"]
  publisher            = var.vmext["publisher"]
  tags                 = local.common_tags
}
