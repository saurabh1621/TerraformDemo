variable "app_region" {
  type = string
}

variable "ami_id" {
  type = map(any)
  default = {
    "ap-south-1"     = "ami-052cef05d01020f1d"
    "ap-southeast-1" = "ami-0d1d4b8d5a0cd293f"
  }
}
