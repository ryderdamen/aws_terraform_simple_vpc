variable "environment" {
    type = string
}

variable "vpc_cidr_block" {
    type = string
}

variable "public_subnet_count" {
    type = number
    default = 3
}

variable "private_subnet_count" {
    type = number
    default = 3
}

variable "public_subnet_tags" {
  default = {}
}

variable "private_subnet_tags" {
  default = {}
}
