terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 6.10.0, < 6.15.0"
    }
  }
}

provider "aws" {
  region = var.region
}