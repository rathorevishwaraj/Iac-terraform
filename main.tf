terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

/*
# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
*/
