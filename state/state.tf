# Variables
variable "region" {
  type        = string
  description = "Default AWS region"
  default     = "eu-central-1"
}

# Provider
provider "aws" {
  region = var.region
}

# Bucket
resource "aws_s3_bucket" "tfstate" {
  bucket = "pp-demo-tfstate"
  lifecycle {
    prevent_destroy = true
  }
}

# enable s3 server-side server_side_encryption_configuration
resource "aws_s3_bucket_server_side_encryption_configuration" "server_side_encryption_tfstate" {
  bucket = aws_s3_bucket.tfstate.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}

# enable versioning
resource "aws_s3_bucket_versioning" "versioning_tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Block public access on bucket
resource "aws_s3_bucket_public_access_block" "block_pub_access_tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}
