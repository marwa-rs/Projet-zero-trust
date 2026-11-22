terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # L'état de Terraform est rangé dans S3, pas sur la VM
  backend "s3" {
    bucket       = "pfs-terraform-state-119033255812"
    key          = "iam-services/terraform.tfstate"
    region       = "eu-north-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      projet   = "pfs"
      gere_par = "terraform"
    }
  }
}
