terraform {
  backend "s3" {
    bucket         = "threatcomposer-tf-state"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-lock"
  }
}