### Main Vars
variable "nsx_manager" {
    type = string
    description = "FQDN of the NSX-T manager"
}

variable "nsx_admin_user" {
    type = string
    description = "Account name for the NSX-T admin account"
}

variable "nsx_admin_pass" {
    type = string
    description = "Password for the NSX-T Admin account"
}

### IP Pool Vars
variable "ip_pools_supernet" {
    type =  string
    description = "Supernet to break out the IP pools from"
}

variable "network_count" {
    type = number
    description = "Number of networks for Terraform to create"
}

variable "display_name" {
    type = string
    description = "Display name for the ip pools"
}