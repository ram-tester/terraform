data "aws_ami" "joindevops" {
  most_recent      = true
  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


data "aws_vpc" "default" {
  default = true
}


output "aws_ami_id" {
  value = data.aws_ami.joindevops.id
}

output "aws_vpc_id" {
  value = data.aws_vpc.default.id
}