/*
variable "prefix" {
  type = string
#  default = "terra"
}
*/

/*
variable "prefix" {
  type = number
#  default = 1
}
*/
/*

variable "prefix" {
  type = bool
  default = true
}
*/

/*
variable "prefix" {
  type = any
  default = "testval01"
}
*/

/*
variable "prefix" {
  type = list #list(number), list(string)
  default = ["One", "Two", "Three"]
}
*/


variable "prefix" {
  type = map #map(string), map(number)
  default = {
    "aws" = "s3_bucket"
    "azure" = "blob_storage"
  }
}


resource "random_pet" "prefix-print" {
  prefix = var.prefix["aws"]
}

output "prefix-value" {
  value = random_pet.prefix-print.prefix
}
