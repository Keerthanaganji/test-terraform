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

# Create Athena workgroup
resource "aws_athena_workgroup" "athena" {
  name        = var.workgroup_name
  description = "Athena Workgroup"
  configuration {
    result_configuration {
      output_location = "s3://${aws_s3_bucket. athena_results_bucket.bucket}/query_result/"
    }
   }
  }

resource "aws_athena_database" "database" {
  name = var.database
  bucket = aws_s3_bucket.athena_results_bucket.bucket
}
resource "aws_glue_crawler" "example" {
  database_name = aws_athena_database.database.name
  name          = "AthenaCrawlerRaw"
  role        = var.gluerole

  s3_target {
   path = var.crawlerbucketpath
  }
}

resource "aws_s3_bucket_policy" "athena_bucket_policy_https" {
  bucket = aws_s3_bucket.athena_results_bucket.id
  policy = data.aws_iam_policy_document.athena_bucket_policy_https.json
}

data "aws_iam_policy_document" "athena_bucket_policy_https" {
  statement {
    actions   = ["s3:*"]
    effect    = "Deny"
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.athena_results_bucket.bucket}",
      "arn:aws:s3:::${aws_s3_bucket.athena_results_bucket.bucket}/*"
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}
