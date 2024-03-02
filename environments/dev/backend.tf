terraform {
  backend "s3" {
    bucket = "terraform-sep23-backend-asel"
    key    = "session-5/dev/modules/terraform.tfstate" # path where you would like to create your terraform.tfstate file
    region = "us-east-1"
  }
}