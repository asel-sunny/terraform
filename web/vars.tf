variable "target_type" {
  type    = string
  default = "instance"
}

variable "health_check_type" {
  type    = string
  default = "ELB"
}

variable "min_size" {
  type    = string
  default = "1"

}

variable "max_size" {
  type    = string
  default = "3"
}

variable "desired_capacity" {
  type    = string
  default = "1"

}
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

variable "default_east-1a" {
  type    = string
  default = "subnet-53ff7c0f"
}

variable "default_east-1b" {
  type    = string
  default = "subnet-05de5862"
}

variable "domain_name" {
  type    = string
  default = "aselicloud.net"
}

variable "record_name" {
  type    = string
  default = "www"
}