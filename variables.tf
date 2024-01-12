# VPC
variable "subnet_names" {
  description = "The names for the subnet."
  type        = list(string)
  default     = ["PublicSubnet1", "PublicSubnet2"]
}

# EC2
variable "ami" {
  description = "The AMI to use for the EC2 instance."
  type        = string
  default     = "ami-05c13eab67c5d8861"
}
variable "instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
  default     = "t2.micro"
}


