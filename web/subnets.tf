resource "aws_default_subnet" "pub-sub1" {
  availability_zone = "us-east-1a"
  tags              = local.common_tags
}

resource "aws_default_subnet" "pub-sub2" {
  availability_zone = "us-east-1b"
  tags              = local.common_tags
}

resource "aws_default_subnet" "pri-sub1" {
  availability_zone = "us-east-1c"
  tags              = local.common_tags
}

resource "aws_default_subnet" "pri-sub2" {
  availability_zone = "us-east-1d"
  tags              = local.common_tags
}




