resource "aws_instance" "Task" {
  ami           = "ami-0461b1436c9b3c1a3"
  instance_type = var.instance_type
  user_data     = <<-EOF
                  #!/bin/bash
                  sudo su
                  yum -y install httpd
                  systemctl enable httpd
                  systemctl start httpd
                  EOF
  tags = {
    Name = var.instance_name
  }
}
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
