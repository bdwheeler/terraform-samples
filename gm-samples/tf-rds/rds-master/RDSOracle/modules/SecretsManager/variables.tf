variable "secret_name" { 
  description = "Leave blank. The system will automatically popuplate this field."
  type = string
   default = "NA"
}

variable "soc_region" {
  description = "Region for the SOC account (to create the Secret)"
  type        = string 
  default     = "us-gov-west-1"
}


variable "soc_access_key"{
  description = "Access Key for the SOC account (to create the Secret)"
  type        = string 
}

variable "soc_secret_key" {
  description = "Secret Key for the SOC account (to create the Secret)"
  type        = string 
}


variable "db_port"{
  description = "The port on which the DB accepts connections"
  type        = string
  default     = "1521"
}


variable "account_name" { 
  description = "AWS Account name (i.e. RFS, MyGinnieMaeDev, DMC3-Test, CICD)"
  type        = string 
  default     = "RFS"
}

variable "engine_name" {
    type    = string
    default = "placeholder"
}

variable "secret_cmk_id" {
}

variable "cicd_role_arn"{
}


variable "secret_value_dbname" {
    type = string
    default = "placeholder"
}

variable "secret_value_dbendpoint" {
    type = string
    default = "placeholder"
}

variable "secret_value_dbarn" {
    type = string
    default = "placeholder"
}

variable "secret_value_dbusername" {
    type = string
    default = "placeholder"
}

variable "secret_value_dbpassword" {
    type = string
    default = "placeholder"
}

