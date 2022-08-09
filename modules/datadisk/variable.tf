variable "rg" {
    type = string
    description = "Datadisk RG"
}
variable "location" {
    default = "Canada Central"
}
variable "tags" {
    type = map(any)
}
variable "linux_disk_name" {
    default = "linux_disk"
}
variable "win_disk_name" {
    default = "win_disk"
}
variable "nb_count" {
    default = 2
}
variable "linux_disk_id" {
    type = list(string)
}
variable "win_disk_id" {
    type = string
}
variable "disk_caching" {
    default = "ReadWrite"
}
variable "lun" {
    default = 0
}