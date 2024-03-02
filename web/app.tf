resource "aws_launch_template" "my_app_launch" {
  name                   = replace(local.name, "sg", "lt")
  image_id               = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg-ec2.id]
  user_data              = filebase64("userdata.sh")
  tags                   = local.common_tags
}

resource "aws_lb_target_group" "my_app_launch" {
  name        = replace(local.name, "sg", "tg")
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_default_vpc.default.id
  target_type = "instance"
  tags        = local.common_tags

#   health_check {
#     enabled             = true
#     port                = 8081
#     interval            = 30
#     protocol            = "HTTP"
#     path                = "/"
#     matcher             = "200"
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#   }
}

resource "aws_autoscaling_group" "my_app_launch" {
  name              = replace(local.name, "sg", "asg")
  min_size          = 1
  desired_capacity  = 1
  max_size          = 3
  health_check_type = "EC2"

  availability_zones = ["us-east-1a"]
  launch_template {
    id = aws_launch_template.my_app_launch.id
  }
  dynamic "tag" {
    for_each = var.extra_tags
    content {
      key = tag.value.key
      propagate_at_launch = tag.value.propagate_at_launch
      value = tag.value.key
    }
    
  }
  target_group_arns = [aws_lb_target_group.my_app_launch.arn]
}

resource "aws_lb" "my_app_launch" {
  name               = replace(local.name, "sg", "alb")
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-alb.id]

  subnets = [
    aws_default_subnet.pri-sub1.id,
    aws_default_subnet.pri-sub2.id
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


