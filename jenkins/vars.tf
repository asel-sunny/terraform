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
  default = "ami-080e1f13689e07408"
}

variable "instance_type" {
  type    = string
  default = "t2.medium"
}

variable "domain_name" {
  type    = string
  default = "aselicloud.net"
}

variable "record_name" {
  type    = string
  default = "www"
}

