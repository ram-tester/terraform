resource "aws_instance" "this" {
  ami = "ami-09c813fb71547fc4f"   #devops-practice ami
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type = "t3.micro"
  tags = {
    Name = "terraform-demo"
    Purpose = "terraform-practice"
  }
  # provisioner "local-exec" {   #local provisioner
  #   command = "echo ${self.private_ip} > inventory"
  # }
  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
    ]
  }
  provisioner "remote-exec" {
    when = destroy
    inline = [
    "sudo systemctl stop nginx",
    ]
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