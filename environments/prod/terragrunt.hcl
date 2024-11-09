terraform {
  source = "../../terraform-modules/vpc"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  cidr_block   = "10.0.2.0/16"
  environment  = "prod"
}

# Configure provider
provider "aws" {
  profile = "prod"
  region  = "us-east-1"
}