provider "aws" {
  region     = "ca-central-1"
  access_key = ""
  secret_key = ""
}

terraform {
  backend "s3" {
    bucket = "sai-ts-learn-tf"
    key    = "Sai-DE-Learn-State-file/DE.tfstate"
    region = "ca-central-1"
  }
}