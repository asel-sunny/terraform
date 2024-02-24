resource "aws_instance" "main" {
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.main.id ]
  tags = {
    Name = "${var.env}-instance", 
    Environment = var.env  # var.variable_name referencing from variables.tf
  }
}




# aws_instance = first_label, defined by terraform the type of resource
# main = second_label, logical name or logical id for the resource . You can have any name, must be unique.
# ami , instance_type = arguments, defined by terraform
# The entire thing is called Block 
# Resource block is to manage and created resources



