variable "soc_region" {
  description = "Region for the SOC account (to create the Secret)"
  type        = string 
  default = "us-west-1"
}

variable "soc_access_key"{
  description = "Access Key for the SOC account (to create the Secret)"
  type        = string 
}

variable "soc_secret_key" {
  description = "Secret Key for the SOC account (to create the Secret)"
  type        = string 
}

variable "secret_name" { 
  type = "string"
}

/*
variable "secret_values" {
  default = {
    DBName = "tres"
    DBEndPoint = "tres.crrkqfc6amb8.us-east-1.rds.amazonaws.com:1521"
    DBARN = "arn:aws-us-gov:ec2:us-east-1:861511318332:vpc/vpc-0a4c258982b48c5f0"
    Username = "usrtres"
    Password = "v^H8AnvDb^"
  }

  type = "map"

  description = "A list with all the key-value pairs that will be stored as a single secret in SOC's Secrets Manager"
}
*/

variable "secret_value_dbname" {
    type = "string"
    default = "placeholder"
}

variable "secret_value_dbendpoint" {
    type = "string"
    default = "placeholder"
}

variable "secret_value_dbarn" {
    type = "string"
    default = "placeholder"
}

variable "secret_value_dbusername" {
    type = "string"
    default = "placeholder"
}

variable "secret_value_dbpassword" {
    type = "string"
    default = "placeholder"
}

variable "secret_cmk_id" {
  default = "b212caf4-3256-4e98-9851-ca49fdfb00c1"
}

variable "cicd_role_arn"{
  default = "arn:aws:iam::046934853828:instance-profile/yorhaMaster"
}
