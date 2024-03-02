resource "aws_security_group" "sg-ec2" {
  name = "ec2-sg"
  #vpc_id = aws_default_vpc.default
}

resource "aws_security_group" "sg-alb" {
  name = "alb-sg"
  #vpc_id = aws_default_vpc.default
}


resource "aws_security_group_rule" "ingress_sg-ec2-alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg-ec2.id
  source_security_group_id = aws_security_group.sg-alb.id
}

# resource "aws_security_group_rule" "ingress_sg-ec2_health_check" {
#   type                     = "ingress"
#   from_port                = 8081
#   to_port                  = 8081
#   protocol                 = "tcp"
#   security_group_id        = aws_security_group.sg-ec2.id
#   source_security_group_id = aws_security_group.sg-alb.id
# }

resource "aws_security_group_rule" "ingress_sg-alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.sg-alb.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress_sg-alb" {
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg-alb.id
  source_security_group_id = aws_security_group.sg-ec2.id
}





