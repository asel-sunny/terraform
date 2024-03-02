terraform {
  required_version = "~> 1.5.7"  #Terraform Version 
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.36.0"      # Provider Version(aws in our case)
    }
  }
}

## Semantic Versioning
# v1.7.3 = Terraform Version
# 1 = Major - Significant changes - Upgrading
# 7 = Minor - Includes new features - Updating
# 3 = Patch - Bug fix, vulnerability fixes, security changes - Patching

## Lazy Constraints
#   ~>
# Example ~> 1.7.3 = 1.7.3 - 1.7.x