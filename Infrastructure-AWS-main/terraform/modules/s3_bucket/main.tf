resource "aws_s3_bucket" "bucket" {
 
  bucket = var.bucket_name_first
}
 
resource "aws_s3_bucket_versioning" "versioning_sample" {
 
 bucket = module.s3_bucket.bucket_id
  versioning_configuration {
    status = "Enabled"
  }
}
