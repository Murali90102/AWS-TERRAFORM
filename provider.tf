terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         	   = "assignment-terraform"
    key              	   = "state/terraform.tfstate"
    region         	   = "ap-south-1"
    encrypt        	   = true
    dynamodb_table = "terra2"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

data "aws_availability_zones" "az" {
    state = "available"
}
