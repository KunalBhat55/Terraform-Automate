resource "aws_security_group" "MainSG" {

  ingress {

    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {

    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    description = "All traffic"
    from_port = 0
    to_port   = 0
    protocol  = "-1"

  }
  vpc_id = var.vpc_id

  tags = {
    Name = "MainSG"
  }

}
output "sg_id" {
  value = aws_security_group.MainSG.id
}
