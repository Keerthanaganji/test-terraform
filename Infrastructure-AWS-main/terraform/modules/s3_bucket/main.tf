resource "aws_s3_bucket" "raw_bucket" {
  bucket = var.raw_bucket_name
}

resource "aws_s3_bucket_versioning" "versioning_bucket" {
  bucket = var.artifact_bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}
