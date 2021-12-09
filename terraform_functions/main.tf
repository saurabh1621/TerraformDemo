variable "vpc_name" {
  description = "Provide VPC Name in Lower Case"
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = lower(var.vpc_name)
    Creation_Time = timestamp()
  }

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, 2)
}


