resource "aws_instance" "ec2-jenkins" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.ec2-sg.id]
  subnet_id                   = aws_default_subnet.pub-sub1.id
  associate_public_ip_address = true
  key_name                    = var.key_name
  user_data                   = file("userdata.sh")
}

