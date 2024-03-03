resource "aws_launch_template" "my_app_launch" {
  name          = replace(local.name, "sg", "lt")
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  #security_groups = [aws_security_group.sg-ec2.id]
  vpc_security_group_ids = [aws_security_group.sg-ec2.id]
  user_data              = filebase64("userdata.sh")
  tags                   = local.common_tags

  lifecycle {
    create_before_destroy = true
  }
}