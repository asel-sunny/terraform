terraform {
  backend "s3" {
    bucket = "terraform-sep23-backend-asel"
    key    = "terraform.tfstate" # path where you would like to create your terraform.tfstate file
    region = "us-east-1"
    workspace_key_prefix = "workspace/project-a"
  }
}

