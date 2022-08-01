provider "aws" {
  region = "us-east-1"
}

#Remote Backend for multiple users
terraform {
  backend "s3" {
    bucket  = "arv-app-cinema-tf-state"
    key     = "arv-app-cinema.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

#Local Backend for one user
locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManageBy    = "Terraform"
    Owner       = "Alejandro Rojas"
  }
}
