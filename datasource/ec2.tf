resource "aws_instance" "this" {
  ami = data.aws_ami.joindevops.id   #devops-practice ami
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type = "t3.micro"
  tags = {
    Name = "terraform-demo"
    Purpose = "terraform-practice"
  }
}
# the dependency security group will create first and then ec2 instance
resource "aws_security_group" "allow_tls" {
  name = "allow_tls"
  description = "Allow tls inbound traffic and all outbound traffic"
  ingress {     # in bound traffic
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {      # out bound traffic
    from_port = 0
    to_port = 0
    protocol = "-1"   # -1 means all protocols allowed
    cidr_blocks = ["0.0.0.0/0"]   # allow all
  }
  tags = {
    Name = "allow_tls"
  }
}