resource "aws_s3_bucket" "bucket" {
 
  bucket_name_first = var.bucket_name_first
}
 
resource "aws_s3_bucket_versioning" "versioning_sample" {
 
 bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "archieve_bucket" {
  bucket = var.bucket_name_archieve
  acl    = "private"

  lifecycle_rule {
    enabled = true

    transition {
      days          = var.lifecycle_transition_days_glacier
      storage_class = "GLACIER"
    }

    transition {
      days          = var.lifecycle_transition_days_deep_archive
      storage_class = "DEEP_ARCHIVE"
    }
  }
}

