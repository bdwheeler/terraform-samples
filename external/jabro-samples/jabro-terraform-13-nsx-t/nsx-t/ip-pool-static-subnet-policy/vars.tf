variable "display_name" {
    type = string
    description = "Name given to the IP pool"
}

variable "pool_path" {
    type = string
    description = "Name given to the IP pool"
}

variable "allocation_range_start" {
    type = string
    description = "IP Ranges allocated to the IP pool"
}

variable "allocation_range_end" {
    type = string
    description = "IP Ranges allocated to the IP pool"
}

variable "cidr" {
    type = string
    description = "CIDR for the IP Pool"
}

variable "gateway" {
    type = string
    description = "Gateway IP for the IP Pool"
}

