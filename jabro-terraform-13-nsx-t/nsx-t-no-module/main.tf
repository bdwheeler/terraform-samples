terraform {
  required_providers {
    nsxt = {
      source = "terraform-providers/nsxt"
    }
  }
  required_version = ">= 0.13"
}

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

provider "nsxt" {
  host           = var.nsx_manager
  username       = var.nsx_admin_user
  password       = var.nsx_admin_pass
  global_manager = true

  allow_unverified_ssl = true
}


resource "nsxt_policy_ip_pool" "ip_pool" {
  count = var.network_count
  display_name = "${var.display_name}-0${count.index}"

  tag {
    scope = "Terraform"
    tag   = "true"
  }

  tag {
    scope = "Management Interface"
    tag   = "Morpheus"
  }
}

output "ip_pool" {
  description = "Outputs from the ip-pool-policy module"
  value       = "${nsxt_policy_ip_pool.ip_pool}"
}

resource "nsxt_policy_ip_pool_static_subnet" "static_subnet" {
  count = var.network_count
  display_name = "${var.display_name}-0${count.index}"
  pool_path    = nsxt_policy_ip_pool.ip_pool[count.index].path
  cidr         = cidrsubnet(var.ip_pools_supernet, 4, count.index )
  gateway      = cidrhost(cidrsubnet(var.ip_pools_supernet, 4, count.index ),"1")

  allocation_range {
    start = cidrhost(cidrsubnet(var.ip_pools_supernet, 4, count.index ),"10")
    end   = cidrhost(cidrsubnet(var.ip_pools_supernet, 4, count.index ),"200")
  }

  tag {
    scope = "Terraform"
    tag   = "true"
  }

  tag {
    scope = "Management Interface"
    tag   = "Morpheus"
  }
}