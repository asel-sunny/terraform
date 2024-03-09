data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.3.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# data "local_file" "userdata" {
#     filename = "userdata.sh"
# }


resource "aws_security_group" "main" {
  name        = "main"
  description = "Allow SSH and HTTP"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_key_pair" "deployer" {
  key_name   = "myMacKeyLocal"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "main" {
  ami                    = data.aws_ami.amazon_linux_2.image_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name               = aws_key_pair.deployer.id

  provisioner "file" {
    source      = "/Users/aselnazarova/terraform/session-8/index.html" # the place where your file exist, path on my laptop
    destination = "/tmp/index.html"                                    # the place where you wanna send your file, path on the remote server

    connection {
      type        = "ssh"
      user        = "ec2-user"            # amazon linux 2 = ec2-user, Ubuntu = ubuntu, Debian = admin, Centos = centos
      host        = self.public_ip        # public IP of your webserver you are trying to send the file , self.public_ip same as aws_instance.main.public_ip
      private_key = file("~/.ssh/id_rsa") # private key of your terraform server, local machine
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"            # amazon linux 2 = ec2-user, Ubuntu = ubuntu, Debian = admin, Centos = centos
      host        = self.public_ip        # public IP of your webserver you are trying to send the file , self.public_ip same as aws_instance.main.public_ip
      private_key = file("~/.ssh/id_rsa") # private key of your terraform server, local machine
    }
  }
}

# You can run only once , better to not use it! Not a helpful resource
resource "null_resource" "wait_acm_validation" {
  provisioner "local-exec" {
    command = "echo 'this is new file' >> test.txt" # Adjust the wait time according to your needs
  }
}


# Packer creates Golden ami , and packer can run Ansible Playbooks on virtual servers using provisioners