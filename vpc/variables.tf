variable "vpc-cidr" {
    type = string
    default = "10.0.0.0/22"
  
}

variable "pub-sub1-cidr" {
    type = string
    default = "10.0.0.0/26"
  
}

variable "pub-sub2-cidr" {
    type = string
    default = "10.0.0.64/26"
  
}

variable "pub-sub3-cidr" {
    type = string
    default = "10.0.0.128/26"
  
}

variable "pri-sub1-cidr" {
    type = string
    default = "10.0.0.192/26"
  
}

variable "pri-sub2-cidr" {
    type = string
    default = "10.0.1.0/26"
  
}

variable "pri-sub3-cidr" {
    type = string
    default = "10.0.1.64/26"
  
}

variable "ami" {
    type = string
    default = "ami-0440d3b780d96b29d"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}