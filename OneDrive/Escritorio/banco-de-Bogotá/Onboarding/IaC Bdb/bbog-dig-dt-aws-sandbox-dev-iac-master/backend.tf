terraform {
  backend "s3" {
    bucket = "sandbox-terraform-dont-delete"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}