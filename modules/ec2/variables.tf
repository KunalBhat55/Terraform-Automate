variable "ami" {
  description = "The AMI to use for the EC2 instance."
  type = string
  default = "ami-0005e0cfe09cc9050"
}
variable "instance_type" {
  description = "The type of EC2 instance to launch."
  type = string
  default = "t2.micro"
}
variable "ec2_names" {
  description = "The name of the EC2 instances."
  type = list(string)
  default = ["WebServer-01", "WebServer-02"]
}
// dynamic
variable "sg_id" {
  description = "Security Group ID"
  type = string
}
variable "subnet_id" {
  description = "Subnet ID for EC2 instance"
  type = list(string)
}
