terraform {

#  backend "s3" {
#    bucket = "terraformbucket019"
#    key    = "Terraform"
#    region = "us-east-2"
#  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}
