variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "Range of IPv4 address for the VPC"
  default     = "10.0.0.0/16"
}

variable "az_count" {
  default = 2
}

variable "tagName" {
  default = "ansibleCourse"
}

variable "instance_count" {
  type = string
  description = "(optional) describe your variable"
  default = 3
}
