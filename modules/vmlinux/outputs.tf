output "vmlinux_hostname" {
  value = azurerm_linux_virtual_machine.vmlinux[*].name
}

output "vmlinux_publicIP" {
  value = azurerm_linux_virtual_machine.vmlinux[*].public_ip_address
}

output "vmlinux_privateIP" {
  value = azurerm_linux_virtual_machine.vmlinux[*].private_ip_address
}

output "vmlinux_dns" {
  value = azurerm_public_ip.pip[*].fqdn
}

output "vmlinux_id" {
  value = azurerm_linux_virtual_machine.vmlinux[*].id
}

output "vmlinuxnic" {
  value = azurerm_network_interface.nic[*].id
}