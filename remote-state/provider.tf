terraform {
  required_providers {
    aws={
      source = "hashicorp/aws",
      version = "5.84.0"
    }
  }

backend "s3" {
    bucket = "altodevops-tf-remote-state"
    key    = "altodevops-expense-backend-infra"
    region = "us-east-1"
    dynamodb_table = "altodevops-state-locking"
}
}

provider "aws" {
  region = "us-east-1"
}