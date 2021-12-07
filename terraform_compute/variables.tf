variable "vpc_id" {
  description = "VPC ID for Instance Mapping"
}

variable "instance_key_name" {
  description = "Key Name for Instance"
}

variable "instance_type" {
  description = "Instance Type"
}

variable "instance_name_tag" {
  default = "Terraform_Instance"
}
