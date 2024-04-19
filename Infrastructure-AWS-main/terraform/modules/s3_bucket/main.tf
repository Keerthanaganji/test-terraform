resource "aws_s3_bucket" "bucket_name" {
  raw_bucket_name = var.raw_bucket_name
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  artifact_bucket_name = var.artifact_bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}
