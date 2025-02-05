variable "environment" {
  default = "dev"
}

variable "project" {
  default = "expense"
}

variable "component" {
  default = "backend"
}
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
    Name="expense-backend-dev"
  }
}