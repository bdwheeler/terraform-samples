locals {
  #  Common tags to be assigned to all resources
  default_tags = {
    Owner    = "<%=username%>"
    Group = "<%=groupName%>"
    Management_Tool = "Terraform"
    Management_Platform = "Morpheus"
  }
  user_inputs = {
      location               = "East US"
      address_space          = ["10.10.0.0/16"]
  }

  subnet_options = {
    cidrMask = "<%=customOptions.cidrMask%>"
    subnetCount = "<%=customOptions.subnetCount%>"
  }
}