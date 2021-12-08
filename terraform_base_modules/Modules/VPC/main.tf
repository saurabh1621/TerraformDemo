resource "aws_vpc" "base" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name_tag
  }
}