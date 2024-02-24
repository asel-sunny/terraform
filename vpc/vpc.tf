####### VPC  ########
resource "aws_vpc" "vpc_tf" {
  cidr_block       = var.vpc-cidr
  instance_tenancy = "default"

  tags = {
    Name = "vpc-tf"
  }
}   

####### Subnets  ########

resource "aws_subnet" "pub-sub1" {
  vpc_id     = aws_vpc.vpc_tf.id
  cidr_block = var.pub-sub1-cidr

  tags = {
    Name = "pub-sub1"
  }
}

resource "aws_subnet" "pub-sub2" {
  vpc_id     = aws_vpc.vpc_tf.id
  cidr_block = var.pub-sub2-cidr

  tags = {
    Name = "pub-sub2"
  }
}

resource "aws_subnet" "pub-sub3" {
  vpc_id     = aws_vpc.vpc_tf.id
  cidr_block = var.pub-sub3-cidr

  tags = {
    Name = "pub-sub3"
  }
}

resource "aws_subnet" "pri-sub1" {
  vpc_id     = aws_vpc.vpc_tf.id
  cidr_block = var.pri-sub1-cidr

  tags = {
    Name = "pri-sub1"
  }
}

resource "aws_subnet" "pri-sub2" {
  vpc_id     = aws_vpc.vpc_tf.id
  cidr_block = var.pri-sub2-cidr

  tags = {
    Name = "pri-sub2"
  }
}

resource "aws_subnet" "pri-sub3" {
  vpc_id     = aws_vpc.vpc_tf.id
  cidr_block = var.pri-sub3-cidr

  tags = {
    Name = "pri-sub3"
  }
}

####### Internet Gateway  #######

resource "aws_internet_gateway" "pub-gw" {
  vpc_id = aws_vpc.vpc_tf.id

  tags = {
    Name = "pub-gw"
  }
}

###### Public Route table  #######

resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.vpc_tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pub-gw.id
  }

  tags = {
    Name = "pub-RT"
  }
}

###### Public RT associations  #######

resource "aws_route_table_association" "pub-rt-association-sub1" {
  subnet_id      = aws_subnet.pub-sub1.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "pub-rt-association-sub2" {
  subnet_id      = aws_subnet.pub-sub2.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "pub-rt-association-sub3" {
  subnet_id      = aws_subnet.pub-sub3.id
  route_table_id = aws_route_table.pub-rt.id
}

######  EIP for NAT  #######

resource "aws_eip" "eip-nat" {
  domain   = "vpc"
}

#######  NATGW ########

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_subnet.pub-sub2.id

  tags = {
    Name = "NAT-gw"
  }
}

###### Private Route table  #######

resource "aws_route_table" "pri-rt" {
  vpc_id = aws_vpc.vpc_tf.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "pri-RT"
  }
}


#######  Private RT associations  ########

resource "aws_route_table_association" "pri-rt-association-sub1" {
  subnet_id      = aws_subnet.pri-sub1.id
  route_table_id = aws_route_table.pri-rt.id
}

resource "aws_route_table_association" "pri-rt-association-sub2" {
  subnet_id      = aws_subnet.pri-sub2.id
  route_table_id = aws_route_table.pri-rt.id
}

resource "aws_route_table_association" "pri-rt-association-sub3" {
  subnet_id      = aws_subnet.pri-sub3.id
  route_table_id = aws_route_table.pri-rt.id
}

