resource "azurerm_public_ip" "pip3" {
  name                = "loadbalancerPIP"
  resource_group_name = var.rg
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_lb" "loadbalancer" {
  name                = "loadbalancer"
  resource_group_name = var.rg
  location            = var.location

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.pip3.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_address_pool" {
  loadbalancer_id = azurerm_lb.loadbalancer.id
  name            = "BackEndAddressPool"
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_association" {
  count                   = var.nb_count
  network_interface_id    = var.vmlinuxnic[count.index]
  ip_configuration_name   = "${var.vmlinux}-ipconfig-${format("%1d", count.index + 1)}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_address_pool.id
}
