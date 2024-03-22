module "vpc" {
  source = "../../modules/vpc" # must be specified (child module)
  #   version = "value"  # optional , specific version of your code

  aws_region           = "us-east-1"
  
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

}

################## Terraform Registry #######################

module "web" {

  # module argument
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0" # if you dont specify , it takes the latest version   
  

  # input variables that are required for the child module
  name          = "web"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnet_0
}

