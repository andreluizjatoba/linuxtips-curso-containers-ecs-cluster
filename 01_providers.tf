terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      managed     = "terraform"
      project     = ""
      environment = "${var.environment}"
    }
  }
}
