/*
provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::046934853828:instance-profile/yorhaMaster"
  }
  region    = "us-east-1"
}

provider "aws" {
  region     = "us-east-1"
  access_key = ""   
  secret_key = ""
}


*/

provider "aws" {
  region     = "${var.region}" 
  access_key = "${var.access_key}"   
  secret_key = "${var.secret_key}"
}
