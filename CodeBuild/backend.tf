terraform {
  backend "s3" {
    bucket = "fkpi-backend-bucket"
    key = "bootstrap/terraform.tfstate"
    region = "eu-central-1"

    dynamodb_table = "fkpi-backend-table"
    encrypt = true
  }
}