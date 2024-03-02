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

  health_check {
    enabled             = true
    port                = 8081
    interval            = 30
    protocol            = "HTTP"
    path                = "/"
    matcher             = "200"
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
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

# resource "aws_autoscaling_policy" "my_app_eg2" {
#   name                   = replace(local.name, "sg", "asg-policy")
#   policy_type            = "TargetTrackingScaling"
#   autoscaling_group_name = aws_autoscaling_group.my_app_eg2.name

#   estimated_instance_warmup = 300

#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }

#     target_value = 25.0
#   }
# }

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

# data "aws_route53_zone" "public" {
#   name         = "antonputra.com"
#   private_zone = false
# }

# resource "aws_acm_certificate" "api" {
#   domain_name       = "api.antonputra.com"
#   validation_method = "DNS"
# }

# resource "aws_route53_record" "api_validation" {
#   for_each = {
#     for dvo in aws_acm_certificate.api.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }

#   allow_overwrite = true
#   name            = each.value.name
#   records         = [each.value.record]
#   ttl             = 60
#   type            = each.value.type
#   zone_id         = data.aws_route53_zone.public.zone_id
# }

# resource "aws_acm_certificate_validation" "api" {
#   certificate_arn         = aws_acm_certificate.api.arn
#   validation_record_fqdns = [for record in aws_route53_record.api_validation : record.fqdn]
# }

# resource "aws_route53_record" "api" {
#   name    = aws_acm_certificate.api.domain_name
#   type    = "A"
#   zone_id = data.aws_route53_zone.public.zone_id

#   alias {
#     name                   = aws_lb.my_app_eg2.dns_name
#     zone_id                = aws_lb.my_app_eg2.zone_id
#     evaluate_target_health = false
#   }
# }

# resource "aws_lb_listener" "my_app_eg2_tls" {
#   load_balancer_arn = aws_lb.my_app_eg2.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   certificate_arn   = aws_acm_certificate.api.arn
#   ssl_policy        = "ELBSecurityPolicy-2016-08"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.my_app_eg2.arn
#   }

#   depends_on = [aws_acm_certificate_validation.api]
# }

