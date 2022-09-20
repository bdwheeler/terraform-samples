locals {
  #  Common tags to be assigned to all resources
  default_tags = {
    Owner    = "<%=username%>"
    Group = "<%=groupName%>"
    Management_Tool = "Terraform"
    Management_Platform = "Morpheus"
  }
  vcenter_data = {
      datacenter    = ""
      cluster       = ""
      dvs           = ""
  }
  user_inputs = {
      resource_pool_name    = "<%=customOptions.vcRpName%>"
      #port_group_count      = "<%=customOptions.subnetCount%>"
      vlan_prefix           = "<%=customOptions.vcVlanPrefix%>"
  }
}