variable "instances" {
  type = map
  default = {
    mysql    = "t3.small"
    frontend = "t3.micro"
    backend  = "t3.micro"
  }
}

variable "domain_name" {
  default = "altodevops.online"
}

variable "zone_id" {
  default = "Z0410737TPA4V2DGJQOZ"
}