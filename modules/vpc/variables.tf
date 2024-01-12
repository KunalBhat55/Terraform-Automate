variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string

}
variable "subnet_cidr" {
  description = "The CIDR block for the subnet."
  type        = list(string)
}
variable "subnet_names" {
  description = "The names for the subnet."
  type        = list(string)
  default     = ["PublicSubnet1", "PublicSubnet2"]
}
