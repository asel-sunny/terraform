resource "aws_security_group" "sg-ec2" {
  name = "ec2-sg"
  tags = local.common_tags
  #vpc_id = aws_default_vpc.default
}

resource "aws_security_group" "sg-alb" {
  name = "alb-sg"
  tags = local.common_tags
  #vpc_id = aws_default_vpc.default
}


resource "aws_security_group_rule" "ingress_sg-ec2-alb" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg-ec2.id
  source_security_group_id = aws_security_group.sg-alb.id

}

resource "aws_security_group_rule" "egress_sg-ec2" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.sg-ec2.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress_sg-alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.sg-alb.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress_sg-alb2" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.sg-alb.id
  cidr_blocks       = ["0.0.0.0/0"]
}




