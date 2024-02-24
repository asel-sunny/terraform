resource "aws_instance" "ec2-tf" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  subnet_id = aws_subnet.pub-sub1.id
  associate_public_ip_address = true
  key_name = "mac-new-personal"
  user_data = "${file("/Users/aselnazarova/terraform/vpc/userdata1.sh")}"
#   user_data = <<-EOF
#    #!/bin/bash
#    sudo dnf install httpd -y
#    sudo systemctl start httpd
#    sudo systemctl enable httpd
#    sudo echo "Task is done!" >> /var/www/html/index.html
#    sudo systemctl restart httpd
#   EOF 

  tags = {
    Name = "ec2-tf"
  }
}

