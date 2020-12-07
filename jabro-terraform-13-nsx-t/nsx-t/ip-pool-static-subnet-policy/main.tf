resource "nsxt_policy_ip_pool_static_subnet" "static_subnet" {
  display_name = var.display_name
  pool_path    = var.pool_path
  cidr         = var.cidr
  gateway      = var.gateway

  allocation_range {
    start = var.allocation_range_start
    end   = var.allocation_range_end
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