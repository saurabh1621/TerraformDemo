# VPC Variables

variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
}

variable "vpc_tag_name" {
  description = "Name of VPC"
}

# Security Group Variables

variable "security_group_name" {
  description = "Name of Security Group"
}

# Route Table Varibles

variable "route_table_name_tag" {
  description = "Name of Route Table"
}

# Subnet Variables

variable "subnet_cidr_block" {
  description = "Subnet CIDR Block"
}

variable "map_public_ip" {
  default = true
}

variable "subnet_name_tag" {
  description = "Name of Subnet"
}

# Instance Variables

variable "instance_ami_id" {
  default = "ami-002068ed284fb165b"
  description = "Instance Image AMI ID"
}

variable "instance_type" {
  description = "Instance Image Type"
}

variable "instance_key_name" {
  default = "personal_aws_ohio"
}

variable "instance_name_tag" {
  description = "Instance Name Tag"
}
