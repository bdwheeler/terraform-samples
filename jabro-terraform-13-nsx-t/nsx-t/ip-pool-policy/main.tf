resource "nsxt_policy_ip_pool" "ip_pool" {
  display_name = var.display_name

  tag {
    scope = "Terraform"
    tag   = "true"
  }

  tag {
    scope = "Management Interface"
    tag   = "Morpheus"
  }
}