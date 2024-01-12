# ALB
resource "aws_lb" "MyALB" {

  name               = "application-load-balancer"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [var.sg_id]
  subnets            = var.subnet_id
  
}
# Target Group
resource "aws_lb_target_group" "alb_target_group" {
  name     = "MyALBTargetGroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  
  
}
# Target Group Attachment
resource "aws_alb_target_group_attachment" "MyALBTargetGroupAttachment" {
  count            = length(var.instance_ids)
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.instance_ids[count.index]
  port             = 80

}
# Listener
resource "aws_lb_listener" "alb_listener" {

  load_balancer_arn = aws_lb.MyALB.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }

}
