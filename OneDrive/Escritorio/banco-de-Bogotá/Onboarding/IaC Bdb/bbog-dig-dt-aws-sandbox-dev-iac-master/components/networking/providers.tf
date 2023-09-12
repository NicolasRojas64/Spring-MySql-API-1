provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

provider "aws" {
  alias  = "ohio"
  region = "us-east-2"
}

terraform {
  required_providers {
    aws = "4.37.0"
  }
}