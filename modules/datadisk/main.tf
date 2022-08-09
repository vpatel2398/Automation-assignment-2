resource "azurerm_managed_disk" "l_disk" {
    count = var.nb_count
    name = "${var.linux_disk_name}-datadisk-${format("%1d", count.index+1)}"
    location = var.location
    resource_group_name = var.rg
    storage_account_type = "Standard_LRS"
    disk_size_gb = "10"
    create_option = "Empty"
    tags = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "l_disk_attach" {
    count = var.nb_count
    virtual_machine_id = var.linux_disk_id [count.index]
    managed_disk_id = element(azurerm_managed_disk.l_disk[*].id, count.index + 1)
    lun = var.lun
    caching = var.disk_caching
    
}

