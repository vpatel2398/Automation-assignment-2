variable "rg" {
    type = string
    description = "database rg"
}
variable "location" {
    default = "Canada Central"
}
variable "tags" {
    type = map(any)
}
variable "username" {
  default = ""
}
variable "password" {
  default = ""
}
variable "server_name" {
    default = ""
}