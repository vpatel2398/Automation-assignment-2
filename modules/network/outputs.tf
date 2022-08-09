output "vnet" {
    value = azurerm_virtual_network.vnet.name
}
output "subnet" {
    value = azurerm_subnet.subnet1.name
}
output "subnet_id" {
    value = azurerm_subnet.subnet1.id
}