resource "aws_lb_target_group" "my_app_launch" {
  name        = replace(local.name, "sg", "tg")
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_default_vpc.default.id
  target_type = var.target_type
  tags        = local.common_tags
}

resource "aws_lb" "my_app_launch" {
  name               = replace(local.name, "sg", "alb")
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-alb.id]

  subnets = [
    aws_default_subnet.pub-sub1.id,
    aws_default_subnet.pub-sub2.id
  ]
}

resource "aws_lb_listener" "my_app_launch" {
  load_balancer_arn = aws_lb.my_app_launch.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_app_launch.arn
  }
}