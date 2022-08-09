variable "tags" {   
    type = map(any)
}
variable "linux_name" {
  default = "n01529156linux"
}
variable "size" {
  default = ""
}
variable "username" {
  default = ""
}
variable "password" {
  default = ""
}
variable "os_disk_attributes" {
  type = map(string)
  default = {
    storage_acc_type = "Premium_LRS"
    disk_size        = "32"
    caching          = "ReadWrite"
  }
}
variable "linuxOSInfo" {
  type = map(string)
  default = {
    publisher  = "OpenLogic"
    offer      = "CentOS"
    sku        = "8_2"
    os_version = "latest"
  }

}
variable "linux_avs" {
  default = "LinuxAvailabilityset"
}
variable "nb_count" {
  default = "2"

}
variable "rg" {
    type = string
    description = "linux resource group"
}
variable "subnet_id" {
    default = ""
}
variable "location" {
    default = "Canada Central"
}
variable "sacc_blob_endpoint" {
    type = string
}
variable "vmextension" {
    default = {
        publisher = "Microsoft.Azure.NetworkWatcher"
        type = "NetworkWatcherAgentLinux"
        type_handler_version = "1.4"
    }        
}