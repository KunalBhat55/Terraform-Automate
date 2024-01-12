variable "sg_id" {
  description = "Security Group ID for alb"
  type        = string
}
variable "subnet_id" {
  description = "Subnet ID for alb"
  type        = list(string)
}
variable "vpc_id" {
  description = "VPC ID for alb"
  type        = string
}
variable "instance_ids" {
  description = "Instance IDs for target group attachment"
  type        = list(string)
}
