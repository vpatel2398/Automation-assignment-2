resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  location            = var.location
  resource_group_name = var.rg
  address_space       = var.vnet_add_space
  tags = var.tags
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1
  resource_group_name  = var.rg
  virtual_network_name = var.vnet
  address_prefixes     = var.subnet_space1
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}