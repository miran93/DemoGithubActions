variable "region" {
    type= string
    default = ""
}

variable "vpc_cidr_block" {
    type= string
    default = ""
}

variable "enable_dns_hostnames"{
    type    = bool
}

variable "enable_dns_support" {
    type    = bool
}

variable "availability_zone" {
   type        = string
   default     = ""
}

variable "tags" {
  type        = map(string)
  default     = {}
}

variable "subnet_cidr_block" {
    type = string
    default = ""
}