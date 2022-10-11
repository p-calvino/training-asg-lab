data "aws_ami" "ubuntu_image" {
  owners      = [var.amzn_ami_owner]
  most_recent = true

  filter {
    name   = "name"
    values = [var.amzn_ami_name]
  }
}

data "aws_subnet" "private1_subnet" {

  filter {
    name   = "tag:Name"
    values = ["Private-Subnet-1"]
  }
}

data "aws_subnet" "private2_subnet" {

  filter {
    name   = "tag:Name"
    values = ["Private-Subnet-2"]
  }
}
data "aws_subnet" "public1_subnet" {

  filter {
    name   = "tag:Name"
    values = ["Public-Subnet-1"]
  }
}

data "aws_subnet" "public2_subnet" {

  filter {
    name   = "tag:Name"
    values = ["Public-Subnet-2"]
  }
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}