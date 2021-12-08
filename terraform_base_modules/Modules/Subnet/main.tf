resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
  map_public_ip_on_launch = var.make_subnet_public

  tags = {
    Name = var.subnet_name_tag
  }
}