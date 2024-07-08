provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "artifact_bucket" {
  bucket        = var.artifact_bucket
  acl    = "private"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
     apply_server_side_encryption_by_default {
       sse_algorithm = "AES256"
       }
    }
  }
  tags = {
   Name =  var.artifact_bucket
   Environment = var.environment
  }
  logging {
    target_bucket = "${aws_s3_bucket.log_bucket.id}"
    target_prefix = "server-access-logs/artifact/"
  }
}


resource "aws_s3_bucket" "raw_bucket" {
  bucket = var.raw_bucket
  acl    = "private"
  server_side_encryption_configuration {
    rule {
     apply_server_side_encryption_by_default {
       sse_algorithm = "AES256"
     }
    }
  }
  tags = {
   Name =  var.raw_bucket
   Environment = var.environment
  }
  logging {
    target_bucket = "${aws_s3_bucket.log_bucket.id}"
    target_prefix = "server-access-logs/raw/"
  }
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = var.log_bucket
  acl    = "private"
  server_side_encryption_configuration {
    rule {
     apply_server_side_encryption_by_default {
       sse_algorithm = "AES256"
     }
    }
  }
  tags = {
   Name =  var.log_bucket
   Environment = var.environment
  }
  
}

resource "aws_s3_bucket" "processed_bucket" {
  bucket = var.processed_bucket
  acl    = "private"
  server_side_encryption_configuration {
    rule {
     apply_server_side_encryption_by_default {
       sse_algorithm = "AES256"
     }
    }
  }
  tags = {
   Name =  var.processed_bucket
   Environment = var.environment
  }
  logging {
    target_bucket = "${aws_s3_bucket.log_bucket.id}"
    target_prefix = "server-access-logs/processed/"
  }
}

resource "aws_s3_bucket" "limfinity_bucket" {
  bucket = var.limfinity_bucket
  acl    = "private"
  server_side_encryption_configuration {
    rule {
     apply_server_side_encryption_by_default {
       sse_algorithm = "AES256"
       }
    }
  }

}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.limfinity_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = var.identifier
    }
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.limfinity_bucket.arn,
      "${aws_s3_bucket.limfinity_bucket.arn}/*",
    ]
  }

  statement {
    actions   = ["s3:*"]
    effect    = "Deny"
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.limfinity_bucket.bucket}",
      "arn:aws:s3:::${aws_s3_bucket.limfinity_bucket.bucket}/*"
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

resource "aws_s3_bucket_policy" "artifact_bucket_policy_https" {
  bucket = aws_s3_bucket.artifact_bucket.id
  policy = data.aws_iam_policy_document.artifact_bucket_policy_https.json
}

resource "aws_s3_bucket_policy" "raw_bucket_policy_https" {
  bucket = aws_s3_bucket.raw_bucket.id
  policy = data.aws_iam_policy_document.raw_bucket_policy_https.json
}

resource "aws_s3_bucket_policy" "log_bucket_policy_https" {
  bucket = aws_s3_bucket.log_bucket.id
  policy = data.aws_iam_policy_document.log_bucket_policy_https.json
}

resource "aws_s3_bucket_policy" "processed_bucket_policy_https" {
  bucket = aws_s3_bucket.processed_bucket.id
  policy = data.aws_iam_policy_document.processed_bucket_policy_https.json
}

data "aws_iam_policy_document" "artifact_bucket_policy_https" {
  statement {
    actions   = ["s3:*"]
    effect    = "Deny"
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.artifact_bucket.bucket}",
      "arn:aws:s3:::${aws_s3_bucket.artifact_bucket.bucket}/*"
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

data "aws_iam_policy_document" "raw_bucket_policy_https" {
  statement {
    actions   = ["s3:*"]
    effect    = "Deny"
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.raw_bucket.bucket}",
      "arn:aws:s3:::${aws_s3_bucket.raw_bucket.bucket}/*"
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

data "aws_iam_policy_document" "log_bucket_policy_https" {
  statement {
    actions   = ["s3:*"]
    effect    = "Deny"
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.log_bucket.bucket}",
      "arn:aws:s3:::${aws_s3_bucket.log_bucket.bucket}/*"
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

data "aws_iam_policy_document" "processed_bucket_policy_https" {
  statement {
    actions   = ["s3:*"]
    effect    = "Deny"
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.processed_bucket.bucket}",
      "arn:aws:s3:::${aws_s3_bucket.processed_bucket.bucket}/*"
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

terraform/modules/s3_bucket/variables.tf

variable "region" {
  description = "The AWS region"
  type        = string
}

variable "environment" {
  description = "The environment name"
}

variable "artifact_bucket" {
  description = "The name of the artifact bucket"
  type        = string
}

variable "log_bucket" {
  description = "The name of the log bucket"
  type        = string
}

variable "raw_bucket" {
  description = "The name of the raw bucket"
  type        = string
}

variable "processed_bucket" {
  description = "The name of the processed bucket"
  type        = string
}

variable "limfinity_bucket" {
  description = "The name of the limfinity bucket"
  type        = string
}

variable "identifier" {
  description = "The ARN for accessing the limfinity bucket"
  type     = list(string)
}
