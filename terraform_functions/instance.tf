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
  count = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.instance_key_name
  subnet_id     = "subnet-0e89d3bc1094f384f"

  user_data = file("createusers.sh")

  security_groups = ["sg-00fefa45a7e54ce34"]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = var.instance_name_tag
  }
}
