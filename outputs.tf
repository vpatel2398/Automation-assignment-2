# resource group
output "rg-name" {
    value = module.rgroup.rg-name
}
output "rg-location" {
    value = module.rgroup.rg-location
}

# Network
output "vnet" {
    value = module.network.vnet
}
output "subnet" {
    value = module.network.subnet
}
output "subnet_id" {
    value = module.network.subnet_id
}

# common
output "lworkshop-name" {
    value = module.common.lworkspace-name
}
output "saccount-name" {
    value = module.common.saccount-name
}
output "vault-name" {
    value = module.common.vault-name
}

# vm linux
output "linux_vm" {
  value = module.vmlinux.linux_vm
}
output "linux_private_IP" {
    value = module.vmlinux.linux_private_IP
}
output "linux_public_IP" {
    value = module.vmlinux.linux_public_IP
}
output "dns_label" {
  value = module.vmlinux.dns_label
}


# vm windows
output "windows_vm" {
  value = module.vmwindows.windows_vm
}
output "windows_private_IP" {
    value = module.vmwindows.windows_private_IP
}
output "windows_public_IP" {
    value = module.vmwindows.windows_public_IP
}
output "win_dns_label" {
  value = module.vmwindows.win_dns_label
}

# loadbalancer
output "lb_name" {
    value = module.loadbalancer.lb_name
}

# database
output "db_name" {
    value = module.database.db_name
}