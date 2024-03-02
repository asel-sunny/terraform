variable "aws_region" {
  default = "us-east-1"  # N.Virginia
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"  # VPC CIDR block based on needs
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]  # Change as needed
}

variable "private_subnet_cidrs" {
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]  # Change as needed
}