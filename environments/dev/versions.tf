terraform {
  required_version = "~> 1.5.7" #Terraform Version 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.36.0" # Provider Version(aws in our case)
    }
  }
}