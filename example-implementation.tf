terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


module "simple-vpc" {
  source               = "./simple-vpc"
  environment          = "staging"
  vpc_cidr_block       = "10.0.0.0/16"
  public_subnet_count  = 3
  private_subnet_count = 3
  public_subnet_tags = {
    "is_this_public" = "Yuuup"
  }
}
