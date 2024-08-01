provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket-cloudminion-github"
}

resource "aws_s3_bucket" "example_bucket2" {
  bucket = "example-bucket-cloudminion-github-second"
}
