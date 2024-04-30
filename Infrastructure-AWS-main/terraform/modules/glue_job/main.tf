resource "aws_glue_job" "job" {
  name                   = var.name
  role_arn               = "arn:aws:iam::992382526479:role/glue_etl_job"
  description            = var.description
  max_retries            = var.max_retries
  timeout                = var.timeout
  worker_type            = "G.1X"
  number_of_workers      = var.number_of_workers
  security_configuration = "test_security_configuration1"


  command {
    script_location = "s3://your-bucket-name/scripts/example_job_script.py" 
    python_version   = var.python_version
  }

  execution_property {
    max_concurrent_runs = 5 # Limit to one concurrent run
  }
}

resource "aws_glue_connection" "testconnection" {
  name = "testconnection"
  description = "Example Glue connection"
  
  connection_properties = {
    "securityGroupIdList" = join(",", var.security_group_ids)
    "subnetId"            = join(",", var.subnet_ids)
    "AWS_REGION"          = "eu-west-1"
  }
}


