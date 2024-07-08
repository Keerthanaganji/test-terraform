# Define the provider
provider "aws" {
  region = var.region # Specify your desired AWS region
}

# Create S3 bucket for query results
resource "aws_s3_bucket" "athena_results_bucket" {
  bucket = var.athena_bucket
  acl    = "private"
  server_side_encryption_configuration {
    rule {
     apply_server_side_encryption_by_default {
       sse_algorithm = "AES256"
     }
    }
  }
  tags = {
   Name =  var.athena_bucket
   Environment = var.environment
  }
 }
