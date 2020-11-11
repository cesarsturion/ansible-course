# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

terraform {
  backend "s3" {
    bucket = "ansible-tfstates-terraform"
    key    = "terraformt.tfstate"
    region = "us-east-1"
  }
}