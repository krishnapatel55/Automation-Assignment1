#rgroup
output "rg" {
  value = module.rgroup.rg
}
output "location" {
  value = module.rgroup.location
}

#network
output "vnet" {
  value = module.network.vnet
}
output "subnet" {
  value = module.network.subnet
}
output "subnet_id" {
  value = module.network.subnet_id
}

#common
output "log_analytics_workspace" {
  value = module.common.log_analytics_workspace
}
output "recovery_services_vault" {
  value = module.common.recovery_services_vault
}
output "standard_storage_account" {
  value = module.common.standard_storage_account
}
output "storage_account_uri" {
  value = module.common.storage_account_uri
}

#vmlinux
output "vmlinux_hostname" {
  value = module.vmlinux.vmlinux_hostname
}
output "vmlinux_publicIP" {
  value = module.vmlinux.vmlinux_publicIP
}
output "vmlinux_privateIP" {
  value = module.vmlinux.vmlinux_privateIP
}
output "vmlinux_dns" {
  value = module.vmlinux.vmlinux_dns
}
output "vmlinux_id" {
  value = module.vmlinux.vmlinux_id
}
output "vmlinuxnic" {
  value = module.vmlinux.vmlinuxnic
}

#vmwindows
output "vmwindows_hostname" {
  value = module.vmwindows.vmwindows_hostname
}
output "vmwindows_publicIP" {
  value = module.vmwindows.vmwindows_publicIP
}
output "vmwindows_privateIP" {
  value = module.vmwindows.vmwindows_privateIP
}
output "vmwindows_dns" {
  value = module.vmwindows.vmwindows_dns
}
output "vmwindows_id" {
  value = module.vmwindows.vmwindows_id
}

#loadbalancer
output "loadbalancer" {
  value = module.loadbalancer.loadbalancer
}

#database
output "database" {
  value = module.database.database
}
