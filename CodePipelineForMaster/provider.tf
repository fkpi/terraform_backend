provider "aws" {
  region = var.region
}

provider "github" {
  version = "2.9.0"
  token = var.github_token
}