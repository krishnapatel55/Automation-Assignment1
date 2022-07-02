module "rgroup" {
  source   = "./modules/rgroup"
  rg       = "1548-assignment1-RG"
  location = "australia east"
}

module "network" {
  source     = "./modules/network"
  rg         = module.rgroup.rg
  location   = module.rgroup.location
  depends_on = [module.rgroup]
}

module "common" {
  source     = "./modules/common"
  rg         = module.rgroup.rg
  location   = module.rgroup.location
  depends_on = [module.rgroup]
}

module "vmlinux" {
  source              = "./modules/vmlinux"
  rg                  = module.rgroup.rg
  location            = module.rgroup.location
  subnet_id           = module.network.subnet_id
  storage_account_uri = module.common.storage_account_uri
  depends_on          = [module.network, module.common]
}

module "vmwindows" {
  source              = "./modules/vmwindows"
  rg                  = module.rgroup.rg
  location            = module.rgroup.location
  subnet_id           = module.network.subnet_id
  storage_account_uri = module.common.storage_account_uri
  depends_on          = [module.network, module.common]
}

module "datadisk" {
  source       = "./modules/datadisk"
  rg           = module.rgroup.rg
  location     = module.rgroup.location
  vmlinux_id   = module.vmlinux.vmlinux_id
  vmwindows_id = module.vmwindows.vmwindows_id
  depends_on   = [module.vmlinux, module.vmwindows]
}

module "loadbalancer" {
  source     = "./modules/loadbalancer"
  rg         = module.rgroup.rg
  location   = module.rgroup.location
  vmlinuxnic = module.vmlinux.vmlinuxnic
  depends_on = [module.vmlinux]
}

module "database" {
  source     = "./modules/database"
  rg         = module.rgroup.rg
  location   = module.rgroup.location
  depends_on = [module.rgroup]
}
