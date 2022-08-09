variable "tags" {
    type = map(any)
}
variable "rg" {
    type = string
    description = "Windows resource group"
}
variable "location" {
    default = "Canada Central"
}
variable "subnet_id" {
    default = ""
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
variable "windows_name" {
    default = "winname"
}
variable "windows_avs" {
    default = "WindowsAvailabilityset"
}

variable "OS_disk_attr" {
    default = {
        creat_option = "Attach"
        disk_size = "128"
        storage_acc_type = "StandardSSD_LRS"
        caching = "ReadWrite"
    }
}
variable "Windows_info" {
    type = map(string)
    default = {
      "Win_publisher" = "MicrosoftWindowsServer"
      "Win_offer" = "WindowsServer"
      "Win_sku" = "2016-Datacenter"
      "Win_version" = "latest" 
    }
}
variable "sacc_blob_endpoint" {
    type = string
}
variable "vmextension" {
    default = {
        publisher = "Microsoft.Azure.Security.AntimalwareSignature"
        type = "AntimalwareConfiguration"
        type_handler_version = "2.58"
    }        
}
