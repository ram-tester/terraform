resource "aws_instance" "this" {
  for_each               = var.instances
  ami                    = "ami-09c813fb71547fc4f" #devops-practice ami
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = each.value
  tags = {
    Name    = each.key
    Purpose = "terraform-practice"
  }
}
# the dependency security group will create first and then ec2 instance
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow tls inbound traffic and all outbound traffic"
  ingress { # in bound traffic
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress { # out bound traffic
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # -1 means all protocols allowed
    cidr_blocks = ["0.0.0.0/0"] # allow all
  }
  tags = {
    Name = "allow_tls"
  }
}
output "ec2_info" {
  value = aws_instance.this
}