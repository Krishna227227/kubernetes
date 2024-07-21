
resource "aws_instance" "web" {
  ami           = "ami-030a5acd7c996ef60"
  instance_type = "t2.micro"
  key_name = "pvk227"

  tags = {
    Name = "test"
  }
}

# Print my private IP

output "myprivateip" {
  value = aws_instance.web.private_ip
}

# creating elastic IP

resource "aws_eip" "lb" {
  instance = aws_instance.web.id
  vpc      = true
}

# creating security group

resource "aws_security_group" "allow_tls" {
  name        = "vasu"

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
  }
}

# attaching security group to instance

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.allow_tls.id
  network_interface_id = aws_instance.web.primary_network_interface_id
}

