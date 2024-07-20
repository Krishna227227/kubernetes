# after including s3 (terraform init -backend-config="access_key=A" -backend-config="secret_key=R")

# adding vpc
resource "aws_vpc" "main" {
  cidr_block       = "30.20.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
    Location = "VJA"
    Envi = "${terraform.workspace}"
  }
}
# adding s3
terraform {
  backend "s3" {
    bucket = "name"
    key    = "terraform.tfstate"
    region = "ap-southeast-2"
  }
}
# to print vpc cidr
output "vpc_cidr" {
  value = "${aws_vpc.main.cidr_block}"
}
