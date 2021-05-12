terraform {
  required_version = ">= 0.11.0"
}

provider "aws" {
  region = "${var.aws_region}"
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_instance" "ubuntu" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = data.aws_availability_zones.available.names

  tags = {
    Name = "HelloWorld"
  }
}
