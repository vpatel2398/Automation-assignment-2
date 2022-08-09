terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01529156RG"
    storage_account_name = "tfstaten01529156sa"
    container_name       = "tfstatefiles"
    key                  = "tfstatekey"
  }
}