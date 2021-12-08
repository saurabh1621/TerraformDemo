resource "aws_route_table" "demo-rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "demo-route-table"
  }
}

resource "aws_main_route_table_association" "associate" {
  vpc_id         = var.vpc_id
  route_table_id = aws_route_table.demo-rt.id
}
