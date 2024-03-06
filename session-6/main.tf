module "vpc" {
  source               = "github.com/asel-sunny/terraform//modules/vpc?ref=v0.0.1" # must be specified (child module)
  aws_region           = "us-east-1"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

}



