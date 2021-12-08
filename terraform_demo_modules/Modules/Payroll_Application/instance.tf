resource "aws_instance" "payment_app_server" {
  ami = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = "${var.app_region}-app-server"
    Environment = var.app_environment
  }
  depends_on = [aws_dynamodb_table.payroll_db, aws_s3_bucket.payroll_bucket]
}
