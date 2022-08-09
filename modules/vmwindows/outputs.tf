output "windows_vm" {
  value = azurerm_windows_virtual_machine.vm2.name
}

output "windows_private_IP" {
    value = azurerm_windows_virtual_machine.vm2.private_ip_address
}
output "windows_public_IP" {
    value = azurerm_windows_virtual_machine.vm2.public_ip_address
}
output "win_dns_label" {
  value = azurerm_public_ip.public_ip.fqdn
}

output "vmwinid" {
    value = azurerm_windows_virtual_machine.vm2.id
}