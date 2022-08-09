variable "rg" {
    default = "common-rg"
    type = string
    description = "Rg name" 
}
variable "location" {   
    default = "Canada Central"
}
variable "tags" {
    type = map(any)
}
variable "lworkspace-name" {
    default = "logspace-01"
}
variable "lworkspace-sku" {
    default = "PerGB2018"
}
variable "lworkspace-retention" {
    default = 30
}
variable "saccount-name" {
    type = string
}
variable "saccount-tier" {
    default = "Standard"
}
variable "saccount-replication" {
    default = "LRS"
}
variable "scvault-name" {
    default = "scvault-1"
}
variable "scvault-sku" {
    default = "Standard"
}



