# Configure the AWS Provider
provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "ansible-tfstates-terraform"
    key    = "terraformt.tfstate"
    region = "us-east-1"
  }
}
# Testar assim:
# https://github.com/hashicorp/terraform/issues/13022
# data "terraform_remote_state" "state" {
#   backend = "s3"
#   config {
#     bucket     = "${var.tf_state_bucket}"
#     lock_table = "${var.tf_state_table}"
#     region     = "${var.region}"
#     key        = "${var.application}/${var.environment}"
#   }
# }
# terraform {
#   backend "s3" {}
# }
# terraform init \ 
#      -backend-config "bucket=$TF_VAR_tf_state_bucket" \ 
#      -backend-config "lock_table=$TF_VAR_tf_state_table" \ 
#      -backend-config "region=$TF_VAR_region" \ 
#      -backend-config "key=$TF_VAR_application/$TF_VAR_environment"