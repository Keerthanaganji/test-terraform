resource "aws_s3_bucket" "test" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "test" {
  bucket = hellosampletest.test.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = hellosampletest.test.id
  versioning_configuration {
    status = "Enabled"
  }
}
