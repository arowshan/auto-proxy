terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0ceecbb0f30a902a6"
  instance_type = "t2.micro"
  key_name= "default-key"
  tags = {
    Name = var.instance_name
  }

  vpc_security_group_ids = ["${aws_security_group.ingress-all-test.id}"]

  user_data = file("${path.module}/outline_vpn.sh")

}

resource "aws_key_pair" "app_server" {
  key_name   = "default-key"
  public_key = "ssh-rsa AA...."
}
