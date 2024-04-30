resource "aws_glue_job" "job" {
  name                   = var.name
  role_arn               = "arn:aws:iam::992382526479:role/glue_etl_job"
  description            = var.description
  max_retries            = var.max_retries
  timeout                = var.timeout
  worker_type            = "G.1X"
  number_of_workers      = var.number_of_workers
  security_configuration = "test_security_configuration1"
  use_glue_catalog      = var.use_glue_catalog

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
    "securityGroupIdList" = ["sg-030c0f8e77df31572", "sg-028f561ebcf411e7a"]
    "subnetId" = var.subnet_ids
    "AWS_REGION" = "eu-west-1"
  }

  physical_connection_requirements {
    subnet_ids = var.subnet_ids
    security_group_ids = var.security_group_ids
  }
}


