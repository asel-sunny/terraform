terraform {
  backend "s3" {
    bucket = "terraform-sep23-backend-asel"
    key    = "project-a/dev/terraform.tfstate" # path where you would like to create your terraform.tfstate file
    region = "us-east-1"
  }
}