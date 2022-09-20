# terraform {
#   required_providers {
#     nsxt = {
#       source  = "vmware/nsxt"
#       version = "~> 3.1.0"
#     }
#   }
# }

provider "nsxt" {
  host           = var.nsx_manager
  username       = var.nsx_admin_user
  password       = var.nsx_admin_pass
  global_manager = true

  allow_unverified_ssl = true
}

module "ip-pool-policy" {
  source = "./ip-pool-policy"
  count = var.network_count

  display_name = "${var.display_name}-0${count.index + 1}"

}

output "ip_pool" {
  description = "Outputs from the ip-pool-policy module"
  value       = "${module.ip-pool-policy}"
}

module "ip-pool-static-subnet-policy" {
  source = "./ip-pool-static-subnet-policy"
  count = var.network_count

  display_name = "${var.display_name}-0${count.index + 1}-subnet"
  pool_path = "${module.ip-pool-policy[count.index].ip_pool.path}"
  cidr = "${cidrsubnet(var.ip_pools_supernet, 4, count.index )}"
  allocation_range_start = "${cidrhost("${cidrsubnet(var.ip_pools_supernet, 4, count.index )}","10")}"
  allocation_range_end = "${cidrhost("${cidrsubnet(var.ip_pools_supernet, 4, count.index )}","200")}"
  gateway = "${cidrhost("${cidrsubnet(var.ip_pools_supernet, 4, count.index )}","1")}"
}