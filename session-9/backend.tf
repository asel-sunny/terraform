terraform {
  backend "s3" {
    bucket = "terraform-sep23-backend-asel"
    key    = "session-9/terraform.tfstate" # path where you would like to create your terraform.tfstate file
    region = "us-east-1"
    dynamodb_table = "terraform-backend-state-locking"
  }
}