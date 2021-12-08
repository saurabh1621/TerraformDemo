resource "aws_eip" "lb" {
  vpc      = true
}

resource "aws_nat_gateway" "nat_gw" {
  subnet_id     = var.subnet_id
  allocation_id = aws_eip.lb.allocation_id

  tags = {
    Name = "Gateway NAT"
  }

  depends_on = [aws_internet_gateway.gw]
}
