variable "region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "The AWS profile name to use with the AWS provider."
  type        = string
  default     = "default"
}
