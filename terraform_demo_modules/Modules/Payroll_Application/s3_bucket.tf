resource "aws_s3_bucket" "payroll_bucket" {
  bucket = "${var.app_region}-${var.bucket}-terra"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "${var.app_region}-${var.bucket}"
    Environment = var.app_environment
  }
}
