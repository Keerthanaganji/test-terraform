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


  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = 125
  }
  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days        = 180
  }

 resource "aws_s3_bucket" "raw_bucket" {
  bucket = var.bucket_name_raw
  acl    = "private"


  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = 125
  }
  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days        = 180
  }

}

