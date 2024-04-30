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

  connections = = ["${aws_glue_connection.testconnection.name}"]
}

resource "aws_glue_connection" "testconnection" {
  name        = "testconnection"
  description = "Example Glue connection"
  
  connection_properties = {
    "securityGroupIdList" = join(",", var.security_group_ids)
    "subnetId"            = join(",", var.subnet_ids)
    "AWS_REGION"          = "eu-west-1"
    "JDBC_CONNECTION_URL" = "jdbc:postgresql://database-1-instance-1.cxg48uoe0isl.eu-west-1.rds.amazonaws.com:5432/mydatabase"
    "USERNAME"            = "postgres"
    "PASSWORD"            = "Ganji1999"
    "JDBC_ENGINE"         = "postgres"
    "JDBC_ENGINE_VERSION" = "15.4"
  }
}
