terraform {
  required_version = ">= 0.15"

  backend "s3" {

    bucket = "terraform-state-files-angautam"
    key    = "us-east-1/string-tmnl.tfstate"

    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}