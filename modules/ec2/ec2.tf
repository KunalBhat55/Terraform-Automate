
data "aws_availability_zones" "availableAZ" {
  state = "available"
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "New_key_Public"
  public_key = tls_private_key.rsa-4096-key.public_key_openssh
  
}
resource "tls_private_key" "rsa-4096-key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_instance" "VPC_EC2" {

  count                       = length(var.ec2_names)
  ami                         = var.ami
  availability_zone           = data.aws_availability_zones.availableAZ.names[count.index]
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.sg_id]
  subnet_id                   = var.subnet_id[count.index]

  user_data = file("${path.module}/scripts/script.sh")

  tags = {
    Name = var.ec2_names[count.index]
  }
  key_name = "New_key_Public"
  depends_on = [ aws_key_pair.ec2_key_pair ]

}
output "aws_instance_public_ip" {
  value = aws_instance.VPC_EC2.*.public_ip
}
output "instance_ids" {
  value = aws_instance.VPC_EC2.*.id
}
output "user_data" {
  value = aws_instance.VPC_EC2.*.user_data
}
