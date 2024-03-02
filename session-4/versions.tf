terraform {
  #required_version = ">=1.5.7, < 1.6"
  required_version = "~> 1.5.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = ">=5.36.0, <5.37.0"
      version = "~> 5.36.0"
    }
  }
}

# Lazy constraints = ~>
# Example: ~> 1.5.0 = 1.5.0 - 1.5.x