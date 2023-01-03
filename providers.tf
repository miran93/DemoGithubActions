terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.20.0"
    }
  }
}

provider "aws" {
    region = "${var.region}"
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}
