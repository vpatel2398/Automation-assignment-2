resource "azurerm_availability_set" "avail_set" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = var.rg
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "5"
  tags = var.tags
}

resource "azurerm_network_interface" "net_interface" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg
  tags                = var.tags

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig1-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.public_ip[*].id, count.index + 1)
  }
}

resource "azurerm_public_ip" "public_ip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.rg
  location            = var.location
  allocation_method   = "Static"
  domain_name_label = "n01529156linux${format("%1d", count.index + 1)}"

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "vm1" {
  count                           = var.nb_count
  name                            = "${var.linux_name}${format("%1d", count.index + 1)}"
  computer_name                   = "${var.linux_name}-com-${format("%1d", count.index + 1)}"
  resource_group_name             = var.rg
  location                        = var.location
  size                            = var.size
  admin_username                  = var.username
  admin_password                  = var.password
  disable_password_authentication = false
  tags                            = var.tags

  availability_set_id = azurerm_availability_set.avail_set.id
  network_interface_ids = [
    element(azurerm_network_interface.net_interface[*].id, count.index + 1)
  ]

  os_disk {
    name                 = "${var.linux_name}-os-disk-${format("%1d", count.index + 1)}"
    caching              = var.os_disk_attributes["caching"]
    storage_account_type = var.os_disk_attributes["storage_acc_type"]
    disk_size_gb = var.os_disk_attributes["disk_size"]
  }

  source_image_reference {
    publisher = var.linuxOSInfo["publisher"]
    offer     = var.linuxOSInfo["offer"]
    sku       = var.linuxOSInfo["sku"]
    version   = var.linuxOSInfo["os_version"]
  }

  boot_diagnostics {
    storage_account_uri = var.sacc_blob_endpoint
  }

  depends_on = [
    azurerm_availability_set.avail_set
  ]
}

resource "azurerm_virtual_machine_extension" "vmextension" {
    count = var.nb_count
    name  = "${var.linux_name}-vmex-${format("%1d", count.index + 1)}"
    publisher = var.vmextension["publisher"]
    virtual_machine_id = azurerm_linux_virtual_machine.vm1[count.index].id 
    type = var.vmextension["type"]
    type_handler_version = var.vmextension["type_handler_version"]
    tags = var.tags
}