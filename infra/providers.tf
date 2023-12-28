terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }

  backend "s3" {
    bucket = "${var.aws_account_id}-statefile"
    key    = var.aws_region
    region = var.aws_region
  }

}