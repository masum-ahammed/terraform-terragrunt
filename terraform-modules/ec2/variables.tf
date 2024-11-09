variable "instance_type" {
  description = "The type of EC2 instance to create."
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the instance to use."
  type        = string
}
