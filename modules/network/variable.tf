variable "rg" {
  default = "network-rg"
  type = string
  description = "Network resource group"
}
variable "location" {
  default = "Canada Central"
}
variable "vnet" {
  default = "Network-Vnet"
}
variable "vnet_add_space" {
  default = ["10.0.0.0/16"]
}
variable "subnet1" {
  default = "network-sub1"
}
variable "subnet_space1" {
  default = ["10.0.1.0/24"]
}
variable "tags" {
    type = map(any)
}