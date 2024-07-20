resource "aws_vpc" "main" {
  cidr_block       = "80.20.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
    Location = "VJA"
    Envi = "${terraform.workspace}"
  }
}
terraform {
  backend "s3" {
    bucket = "name"
    key    = "terraform.tfstate"
    region = "ap-southeast-2"
  }
}
output "vpc_cidr" {
  value = "${aws_vpc.main.cidr_block}"
}
