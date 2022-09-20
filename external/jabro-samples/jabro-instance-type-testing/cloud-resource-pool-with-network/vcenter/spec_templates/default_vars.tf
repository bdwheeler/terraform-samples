variable "user" {
    type = string
}

variable "password" {
    type = string
}

variable "vsphere_server" {
    type = string
}

variable "port_group_count" {
    type = string
    default = "<%=customOptions.subnetCount%>"
}