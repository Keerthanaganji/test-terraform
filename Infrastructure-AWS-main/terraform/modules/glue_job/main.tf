resource "aws_glue_job" "job" {
  name                   = var.name
  role_arn               = "arn:aws:iam::992382526479:role/glue-etl-job"
  description            = var.description
  max_retries            = var.max_retries
  timeout                = var.timeout
  worker_type            = "G.1X"
  number_of_workers      = var.number_of_workers
  security_configuration = "test_security_configuration1"

  command {
    script_location = "s3://your-bucket-name/scripts/example_job_script.py" 
    python_version   = var.python_version
    "--extra-py-files"                        = length(var.extra_py_files) > 0 ? join(",", var.extra_py_files) : null
    "--extra-jars"                            = length(var.extra_jars) > 0 ? join(",", var.extra_jars) : null
    "--user-jars-first"                       = var.user_jars_first
    "--use-postgres-driver"                   = var.use_postgres_driver
    "--extra-files"                           = length(var.extra_files) > 0 ? join(",", var.extra_files) : null
  }

  execution_property {
    max_concurrent_runs = 5 # Limit to one concurrent run
  }

}
  type        = string
  description = "(optional) describe your variable"
  default     = "SSE_KMS"
}

variable "bucket_name" {
  type = string
}

variable "database" {
  type        = string
  description = "Name of the database"
  default     = "mydatabase"
}
