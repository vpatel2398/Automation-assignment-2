resource "azurerm_availability_set" "avail_set" {
    name = var.windows_avs
    location = var.location
    resource_group_name = var.rg
    platform_fault_domain_count = "2"
    platform_update_domain_count = "5"
}

resource "azurerm_network_interface" "net_interface" {
    name = "${var.windows_name}-nic"
    location = var.location
    resource_group_name = var.rg
    tags = var.tags

    ip_configuration {
      name = "${var.windows_name}-ipconfig1"
      subnet_id = var.subnet_id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.public_ip.id
    }
}

resource "azurerm_public_ip" "public_ip" {
    name = "${var.windows_name}-pip"
    resource_group_name = var.rg
    location = var.location
    allocation_method = "Static"
    domain_name_label = "${var.windows_name}-dns"
    
    tags = var.tags
}

resource "azurerm_windows_virtual_machine" "vm2" {
    name = var.windows_name
    computer_name = var.windows_name
    resource_group_name = var.rg
    location = var.location
    size = var.size
    admin_username = var.username
    admin_password = var.password
    tags = var.tags
    
    network_interface_ids = [
        azurerm_network_interface.net_interface.id
    ]
    availability_set_id = azurerm_availability_set.avail_set.id

    os_disk {
        name = "${var.windows_name}-os-disk"
        caching = var.OS_disk_attr["caching"]
        storage_account_type = var.OS_disk_attr["storage_acc_type"]
        disk_size_gb = var.OS_disk_attr["disk_size"]
    }

    source_image_reference {
        publisher = var.Windows_info["Win_publisher"]
        offer = var.Windows_info["Win_offer"]
        sku   = var.Windows_info["Win_sku"]
        version = var.Windows_info["Win_version"]
    }
    winrm_listener{
        protocol = "Http"
    }
    boot_diagnostics {
        storage_account_uri = var.sacc_blob_endpoint
    }
    depends_on = [
      azurerm_availability_set.avail_set
    ]
  
}

resource "azurerm_virtual_machine_extension" "vmextension" {
    name  = "${var.windows_name}-vmex"
    publisher = var.vmextension["publisher"]
    virtual_machine_id = azurerm_windows_virtual_machine.vm2.id 
    type = var.vmextension["type"]
    type_handler_version = var.vmextension["type_handler_version"]
    tags = var.tags
}

