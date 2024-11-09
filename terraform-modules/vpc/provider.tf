terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}


variable "region" {
  description = "The AWS region to deploy resources into"
  default     = "us-west-2"  # Adjust default as necessary or omit if always provided by Terragrunt
}

variable "profile" {
  description = "The AWS CLI profile to use"
  default     = "default"  # Adjust default as necessary or omit if always provided by Terragrunt
}