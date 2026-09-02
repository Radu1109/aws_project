terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "cmtr3213qed24fdsyay"
    key            = "dev/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "Lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}