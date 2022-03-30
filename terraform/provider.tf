provider "aws" {
  region = "us-east-1"
}

# terraform {
#   backend "s3" { 
#     bucket         = "swvl-testing-tfstate"
#     key            = "terraform-tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "swvl-testing-terraform-lock"
#   }
# }
