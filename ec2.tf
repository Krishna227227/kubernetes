resource "aws_instance" "web1" {
  ami           = "ami-030"
  instance_type = "t2.medium"
  key_name = "pv"

  tags = {
    Name = "test"
  }
}
