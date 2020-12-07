output "ip_pool" {
  description = "Outputs from the ip-pool-policy module"
  value       = "${nsxt_policy_ip_pool.ip_pool}"
}