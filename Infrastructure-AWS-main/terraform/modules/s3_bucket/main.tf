resource "aws_s3_bucket" "bucket" {
 
  bucket = var.bucket_name_first
}
 
resource "aws_s3_bucket_versioning" "versioning-sample" {
 
 bucket = var.bucket_name_second
  versioning_configuration {
    status = "Enabled"
  }
}
