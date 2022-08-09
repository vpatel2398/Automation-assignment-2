variable "rg" {
    type = string
    description = "loadbalancer rg"
}
variable "location" {
    default = "Canada Central"
}
variable "tags" {
    type = map(any)
}
variable "vm_linux_name" {
    default = "n01529156linux"
}
variable "linux_net_interface" {
    type = list(any)
}
variable "nb_count" {
    default = 2
}