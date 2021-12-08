variable "app_region" {
  type = string
}

variable "app_environment" {
  type = string
}

variable "bucket" {
  default = "fexit-payroll-alpha-2021c"
}

variable "ami" {
  type = any
}
