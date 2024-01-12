variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default = "10.0.0.0/16"

}
variable "subnet_cidr" {
  description = "The CIDR block for the subnet."
  type        = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}
variable "subnet_names" {
  description = "The names for the subnet."
  type        = list(string)
  default     = ["PublicSubnet1", "PublicSubnet2"]
}
