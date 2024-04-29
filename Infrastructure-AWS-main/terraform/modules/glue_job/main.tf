resource "aws_glue_security_configuration" "example_security_configuration" {
  name                 = "example-glue-security-configuration"
  encryption_configuration {
    cloudwatch_encryption {
      cloudwatch_encryption_mode = "DISABLED"
    }
    job_bookmarks_encryption {
      job_bookmarks_encryption_mode = "DISABLED"
    }
    s3_encryption {
      s3_encryption_mode = "DISABLED"
    }
    connection_to_resources {
      subnet_ids         = ["subnet-123456789", "subnet-987654321"]  # Specify your subnet IDs
      security_group_ids = ["sg-0123456789abcdef0"]  # Specify your security group IDs
    }
  }
}

resource "aws_glue_job" "job" {
  name                   = var.name
  role_arn               = "arn:aws:iam::992382526479:role/glue_etl_job"
  connections            = var.connections
  description            = var.description
  glue_version           = var.glue_version
  max_retries            = var.max_retries
  timeout                = var.timeout
  security_configuration = var.security_configuration
  worker_type            = var.worker_type
  number_of_workers      = var.number_of_workers

  command {
    script_location = var.script_location 
    python_version  = var.python_version
  }

}
 
