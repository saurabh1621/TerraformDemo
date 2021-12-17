# Create VPC

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_tag_name
  }
}

# Create Security Group

resource "aws_security_group" "allow_ssh" {
  name        = var.security_group_name
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

# Create route Table

resource "aws_route_table" "demo-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.route_table_name_tag
  }
}

# Set Default Route table for VPC

resource "aws_main_route_table_association" "associate" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.demo-rt.id
}

# Create Internet Gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

# Create Subnet

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_block
  map_public_ip_on_launch = var.map_public_ip

  tags = {
    Name = var.subnet_name_tag
  }
}

# Create Virtual Machine

resource "aws_instance" "web" {
  ami           = var.instance_ami_id
  instance_type = var.instance_type
  key_name      = var.instance_key_name
  subnet_id     = aws_subnet.main.id

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = var.instance_name_tag
  }
}
