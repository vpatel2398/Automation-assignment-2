resource "azurerm_log_analytics_workspace" "lworkspace" {
    name = var.lworkspace-name
    resource_group_name = var.rg
    location = var.location   
    sku = var.lworkspace-sku   
    retention_in_days = var.lworkspace-retention
    tags = var.tags 
}
resource "azurerm_storage_account" "saccount" {
    name = var.saccount-name
    resource_group_name = var.rg
    location = var.location
    account_tier = var.saccount-tier  
    account_replication_type = var.saccount-replication  
    tags = var.tags   
}
resource "azurerm_recovery_services_vault" "scvault" {
    name = var.scvault-name
    resource_group_name = var.rg   
    location = var.location
    sku = var.scvault-sku   
    soft_delete_enabled = true
    tags = var.tags    
}
resource "azurerm_storage_container" "ssa_container" {
    name = "tfstatefiles"
    storage_account_name = azurerm_storage_account.saccount.name
    container_access_type = "private"
}