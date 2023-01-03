variable "elbeanstalk_app-name" {
    type = string
    default = "" 
}
variable "elbeanstalk_app-description" {
    type = string
    default = "" 
}
variable "elbeanstalk_app-environment" {
    type = string
    default = ""
}
variable "elbeanstalk_solution_stack" {
    type = string
    default = ""
}

variable "subnet" {
    type = string
    default = null
}

variable "vpc_id" {
  type        = string
  default     = null
}

variable "InstanceProfileNamespace" {
  type = string
}

variable "InstanceProfileName" {
  type = string
}

variable "EC2-Role" {
  type = string
}