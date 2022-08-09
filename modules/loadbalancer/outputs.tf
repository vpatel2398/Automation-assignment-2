output "lb_name" {
    value = azurerm_lb.frontend.name
}
output "lbfqdn" {
    value = azurerm_public_ip.public_ip.fqdn
  
}