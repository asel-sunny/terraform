resource "aws_instance" "main" {
  #provider = aws.ohio
  count = 1
  ami           = data.aws_ami.amazon_linux_2.image_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.main.id ]
  user_data = data.template_file.userdata.rendered
  tags = {
    Name = "${var.env}-instance",    # dev-instance 
    Name2 = format("%s-instance", var.env)   # dev-instance
    Name3 = format("%d instance", 1)   # 1 instance
    Environment = var.env  # var.variable_name referencing from variables.tf
  }

  lifecycle {
    create_before_destroy = true
  }
}






# aws_instance = first_label, defined by terraform the type of resource
# main = second_label, logical name or logical id for the resource . You can have any name, must be unique.
# ami , instance_type = arguments, defined by terraform
# The entire thing is called Block 
# Resource block is to manage and created resources



