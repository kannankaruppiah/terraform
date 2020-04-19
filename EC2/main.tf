provider "aws" {

  region = "us-east-2"

}

resource "aws_key_pair" "example_kp" {
  key_name   = "example-key"
  public_key = "test"
}
resource "aws_security_group" "example_SG" {
  name = "allow_ssh"


  ingress {
    description = "ssh traffic"
    from_port   = 26
    to_port     = 26
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_example_sg"
  }
}
resource "aws_instance" "example_Instance" {
  count                  = 3
  ami                    = "ami-0f7919c33c90f5b58"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.example_SG.id}"]
  key_name               = "${aws_key_pair.example_kp.id}"
  tags = {
    Name = "my-Formatted first-terraform-instance"
  }
}
