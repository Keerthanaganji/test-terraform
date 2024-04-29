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
      subnet_ids         = ["subnet-03a665b3db2978814", "subnet-0731f902c06ec204c"] # Specify your subnet IDs
      security_group_ids = "sg-030c0f8e77df31572", "sg-028f561ebcf411e7a"]  # Specify your security group IDs
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
  security_configuration = aws_glue_security_configuration.example_security_configuration.name

  command {
    name             = "pythonshell"
    script_location = "s3://your-bucket-name/scripts/example_job_script.py" 
    python_version  = var.python_version
  }

   execution_property {
    max_concurrent_runs = 5 # Limit to one concurrent run
  }

}
 
