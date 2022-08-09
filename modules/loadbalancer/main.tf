resource "azurerm_lb" "frontend" {
    name = "LB_frontend"
    resource_group_name = var.rg
    location = var.location
    frontend_ip_configuration {
        name = "pub_ip"
        public_ip_address_id = azurerm_public_ip.public_ip.id
    }
}
resource "azurerm_lb_backend_address_pool" "backend_pool" {
    loadbalancer_id = azurerm_lb.frontend.id
    name = "LB_backend_pool"
}
resource "azurerm_public_ip" "public_ip" {
    name = "loadbalancer_public_IP"
    resource_group_name = var.rg
    location = var.location
    allocation_method = "Static"
    domain_name_label = "frontlbdns"
}
resource "azurerm_lb_rule" "frontLB_rule" {
    loadbalancer_id = azurerm_lb.frontend.id
    name = "LBrule"
    protocol = "Tcp"
    frontend_ip_configuration_name = "pub_ip"
    frontend_port = 80
    backend_port = 80
    backend_address_pool_ids = [azurerm_lb_backend_address_pool.backend_pool.id]
}
resource "azurerm_network_interface_backend_address_pool_association" "lb_association" {
    count = var.nb_count
    network_interface_id = var.linux_net_interface[count.index]
    ip_configuration_name = "${var.vm_linux_name}-ipconfig1-${format("%1d", count.index + 1)}"
    backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id

}