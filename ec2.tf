resource "aws_instance" "web1" {
  ami           = "ami-030a5acd7c996ef60"
  instance_type = "t2.medium"
  key_name = "pvk227"

  tags = {
    Name = "test9"
  }
}
