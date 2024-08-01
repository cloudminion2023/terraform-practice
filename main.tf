provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example_bucket" {
  count  = var.check_duplicate ? 1 : 0
  bucket = "example-bucket-cloudminion-github"
}

resource "aws_s3_bucket" "example_bucket2" {
  count  = var.check_duplicate ? 1 : 0
  bucket = "example-bucket-cloudminion-github-second"
}

resource "aws_s3_bucket" "example_bucket3" {
  count  = var.check_duplicate ? 1 : 0
  bucket = "example-bucket-cloudminion-github-second"
}
