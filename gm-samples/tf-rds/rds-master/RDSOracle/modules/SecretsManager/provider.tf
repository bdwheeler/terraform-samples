/*
provider "aws" {
  assume_role {
    role_arn     = "arn:aws-us-gov:iam::676984028973:role/SOC_EC2FullAccess_Role"
  }
  region    = "us-gov-west-1"
}

provider "aws" {
  region     = "us-gov-west-1"
  access_key = ""   
  secret_key = ""
}
*/

provider "aws" {
  region     = var.soc_region 
  access_key = var.soc_access_key   
  secret_key = var.soc_secret_key
}
