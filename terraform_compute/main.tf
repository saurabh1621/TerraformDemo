data "aws_subnet" "selected" {
  id = "subnet-0e89d3bc1094f384f"
}

data "aws_security_group" "selected" {
  id = "sg-00fefa45a7e54ce34"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.instance_key_name
  subnet_id     = data.aws_subnet.selected.id

  security_groups = [data.aws_security_group.selected.id]

  tags = {
    Name = var.instance_name_tag
  }
}

