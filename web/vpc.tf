resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# import {
#   to = aws_default_vpc.default
#   id = "vpc-d17daeab"
# }