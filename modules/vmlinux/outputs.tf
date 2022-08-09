output "linux_vm" {
  value = azurerm_linux_virtual_machine.vm1[*].name
}
output "linux_private_IP" {
    value = azurerm_linux_virtual_machine.vm1[*].private_ip_address
}
output "linux_public_IP" {
    value = azurerm_linux_virtual_machine.vm1[*].public_ip_address
}
output "dns_label" {
  value = azurerm_public_ip.public_ip[*].domain_name_label
}
output "linux_id" {
    value = azurerm_linux_virtual_machine.vm1[*].id
}
output "linux_net_interface" {
    value = azurerm_network_interface.net_interface[*].id
}