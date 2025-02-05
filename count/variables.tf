variable "ami" {
  default = "ami-09c813fb71547fc4f"
}

variable "environment" {
  default = "prod"
}

# variable "ec2_tags" {
#   type = map
#   default = {
#     Project     = "expense"
#     Component   = "backend"
#     Environment = "dev"
#     Name = "expense-backend-dev"
#   }
# }

variable "from_port" {
  type = number
  default = 22
}
variable "to_port" {
  type = number
  default = 22
}

variable "cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  type = map
  default = {
    Name = "expense-backend-dev"
  }
}

variable "instances_type" {
  type = list(string)
  default = ["mysql","backend","frontend"]
}

variable "common_tags" {
  type = map
  default = {
    Project = "expense"
    Environment = "dev"
  }
}

variable "zone_id" {
  default = "Z0410737TPA4V2DGJQOZ"
}
variable "domain" {
  default = "altodevops.online"
}