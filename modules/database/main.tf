resource "azurerm_postgresql_server" "database_server" {
    name = var.server_name
    resource_group_name = var.rg
    location = var.location

    administrator_login = var.username
    administrator_login_password = var.password

    sku_name = "GP_Gen5_4"
    storage_mb = 5120
    backup_retention_days = 7
    geo_redundant_backup_enabled = false 
    auto_grow_enabled = true 
    version = "9.5"
    ssl_enforcement_enabled = true  
}

resource "azurerm_postgresql_database" "database" {
    name = "Database"
    resource_group_name = var.rg
    server_name = azurerm_postgresql_server.database_server.name
    charset = "UTF8"
    collation = "English_United States.1252"
}