variable "app_name" {
  type    = string
  default = "my-app"

}

variable "key_name" {
  type    = string
  default = "mac-new-personal"

}

variable "team" {
  type    = string
  default = "devops"

}

variable "env" {
  type    = string
  default = "dev"

}

variable "app" {
  type    = string
  default = "backend"

}

variable "project" {
  type    = string
  default = "tom"

}

variable "managed_by" {
  type    = string
  default = "terraform"

}

variable "owner" {
  type    = string
  default = "asel"

}

variable "ami" {
  type    = string
  default = "ami-0440d3b780d96b29d"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "extra_tags" {
  default = [
    {
      key                 = "env"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "team"
      value               = "devops"
      propagate_at_launch = true
    },
    {
      key                 = "app"
      value               = "backend"
      propagate_at_launch = true
    },
    {
      key                 = "project"
      value               = "tom"
      propagate_at_launch = true
    },
    {
      key                 = "managed_by"
      value               = "terraform"
      propagate_at_launch = true
    },
    {
      key                 = "owner"
      value               = "asel"
      propagate_at_launch = true
    },
  ]
}


# variable "pub-sub1-cidr" {
#     type = string
#     default = "172.31.0.0/26"

# }

# variable "pub-sub2-cidr" {
#     type = string
#     default = "172.31.0.64/26"

# }


# variable "pri-sub1-cidr" {
#     type = string
#     default = "172.31.0.192/26"

# }

# variable "pri-sub2-cidr" {
#     type = string
#     default = "172.31.1.0/26"

# }

# variable "ports" {
#   type        = list(number)
#   description = "these are port numbers for the instance"
#   default     = [80, 22, 3306, 53]
#   # even though numbers dont match cidr blocks, it will take new ports and again loop cidr blocks from the start
# }