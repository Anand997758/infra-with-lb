resource "aws_instance" "jeknins" {

  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.own_key.id
  subnet_id     = aws_subnet.private_subnet1.id

  security_groups = [aws_security_group.jenkins-sg.id]
  user_data = file("jenkins.sh")

  tags = {
    Name = "jenkins"
  }
}
