resource "aws_glue_job" "job" {
  name                   = var.name
  role_arn               = "arn:aws:iam::992382526479:role/glue_etl_job"
  description            = var.description
  max_retries            = var.max_retries
  timeout                = var.timeout
  number_of_workers      = var.number_of_workers
  security_configuration = "test_security_configuration1"


  command {
    name             = "pythonshell"
    script_location = "s3://your-bucket-name/scripts/example_job_script.py" 
    python_version   = var.python_version
  }

  execution_property {
    max_concurrent_runs = 5 # Limit to one concurrent run
  }
}

