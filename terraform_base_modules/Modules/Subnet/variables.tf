variable "vpc_id" {
    description = "VPC ID"
}

variable "cidr_block" {
    description = "Subnet CIDR Block"
}

variable "make_subnet_public" {
    description = "Set True to make Subnet Public"
}

variable "subnet_name_tag" {
    description = "Name tag for Subnet"
}