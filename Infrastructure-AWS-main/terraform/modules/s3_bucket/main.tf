resource "aws_s3_bucket" "bucket" {
 
  bucket = var.bucket_name_first
}
 
resource "aws_s3_bucket_versioning" "versioning_sample" {
 
 bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
