terraform {
  required_version = ">= 1.0"
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  exclude_names = ["ap-southeast-1a","ap-southeast-1c"]
}
