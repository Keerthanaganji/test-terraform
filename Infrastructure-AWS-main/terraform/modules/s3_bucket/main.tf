resource "aws_s3_bucket" "test" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "test" {
  bucket = mysamplebuckettest.test.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = mysamplebuckettest.test.id
  versioning_configuration {
    status = "Enabled"
  }
}
