resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name_first
  acl    = "private"
}
 
resource "aws_s3_bucket_versioning" "artifact_bucket" {
 
 bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = var.bucket_name_log
  acl    = "private"


    lifecycle_rule {
    id      = "example-rule"
    enabled = true

    transition {
      days          = 125
      storage_class = "INTELLIGENT_TIERING"
    }
  }
}


