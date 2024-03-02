locals {
  name = "aws-${var.team}-${var.env}-${var.app}-sg-${var.project}"
  common_tags = {
    Environment = var.env,
    Team        = var.team,
    Application = var.app,
    Project     = var.project,
    Managed_by  = var.managed_by,
    Owner       = var.owner
  }
}