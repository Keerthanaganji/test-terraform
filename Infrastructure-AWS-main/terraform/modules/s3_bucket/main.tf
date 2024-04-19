resource "aws_s3_bucket" "bucket_name" {
  raw_bucket = var.raw_bucket_name
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  artifact_bucket = var.artifact_bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}
