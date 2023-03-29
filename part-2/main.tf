terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
    heroku = {
      source  = "heroku/heroku"
      version = "4.6.0"
    }
  }
}
