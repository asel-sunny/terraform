data "aws_ami" "amazon_linux_2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.3.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# data "local_file" "userdata" {
#     filename = "userdata.sh"
# }

data "template_file" "userdata" {
    template = file("userdata.sh")
    vars = {
        env = var.env
    }
}   