
resource "aws_autoscaling_group" "my_app_launch" {
  name                      = replace(local.name, "sg", "asg")
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  health_check_type         = var.health_check_type
  vpc_zone_identifier       = [aws_default_subnet.pub-sub1.id, aws_default_subnet.pub-sub2.id]
  health_check_grace_period = 20
  #availability_zones = ["us-east-1a", "us-east-1b"]
  launch_template { # you can either specify launch_configuration 
    id = aws_launch_template.my_app_launch.id
  }
  dynamic "tag" {
    for_each = var.extra_tags
    content {
      key                 = tag.value.key
      propagate_at_launch = tag.value.propagate_at_launch
      value               = tag.value.key
    }

  }
  target_group_arns = [aws_lb_target_group.my_app_launch.arn]
}




