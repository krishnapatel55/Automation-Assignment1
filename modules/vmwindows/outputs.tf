output "vmwindows_hostname" {
  value = [azurerm_windows_virtual_machine.vmwindows.name]
}

output "vmwindows_publicIP" {
  value = [azurerm_windows_virtual_machine.vmwindows.public_ip_address]
}

output "vmwindows_privateIP" {
  value = [azurerm_windows_virtual_machine.vmwindows.private_ip_address]
}

output "vmwindows_dns" {
  value = [azurerm_public_ip.pip2.fqdn]
}

output "vmwindows_id" {
  value = azurerm_windows_virtual_machine.vmwindows.id
}
