resource "aws_instance" "expense" {
  count = length(var.instances_type)
  ami = var.ami   #devops-practice ami
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type = "t3.micro"
  tags = merge(
    var.common_tags,
    {
      Name = var.instances_type[count.index]
    }
  )
}
# the dependency security group will create first and then ec2 instance
resource "aws_security_group" "allow_tls" {
  name = "allow_tls"
  description = "Allow tls inbound traffic and all outbound traffic"
  ingress {     # in bound traffic
    from_port = var.from_port
    to_port = var.to_port
    protocol = "tcp"
    cidr_blocks = var.cidr_blocks
  }
  egress {      # out bound traffic
    from_port = 0
    to_port = 0
    protocol = "-1"   # -1 means all protocols allowed
    cidr_blocks = ["0.0.0.0/0"]   # allow all
  }
  tags = var.sg_tags
}