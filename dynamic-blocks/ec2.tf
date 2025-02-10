resource "aws_instance" "this" {
  ami = "ami-09c813fb71547fc4f"   #devops-practice ami
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
  dynamic "ingress" {     # in bound traffic
    for_each = var.ingress_ports
    content
    {
    from_port = ingress.value["from_port"]
    to_port = ingress.value["to_port"]
    protocol = ingress.value["tcp"]
    cidr_blocks = ingress.value["cidr_blocks"]
    }
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