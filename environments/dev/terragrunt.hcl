terraform {
  source = "../../terraform-modules/vpc"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  cidr_block   = "10.0.0.0/16"
  environment  = "dev",
  region       = "us-east-1"  # Specify the region
  profile      = "default"  # Specify the AWS profile
}

