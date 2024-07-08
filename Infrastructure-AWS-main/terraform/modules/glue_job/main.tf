provider "aws" {
  region = var.region
}

#resource "aws_cloudwatch_log_group" "gluelog" {
#  name  = var.log_group_name
#  retention_in_days = var.retention_in_days
#}

resource "aws_glue_connection" "example"{
  name               = var.glue_connection_name    
  connection_type    = var.connection_type
  physical_connection_requirements {
    security_group_id_list = var.glue_security_group_id_list
    subnet_id              = var.glue_subnet_id
    availability_zone      = var.availability_zone
  }
}

resource "aws_glue_job" "labware8_to_raw" {
  name                   = var.glue_job_name
  role_arn               = var.role_arn
  description            = var.description
  max_retries            = var.max_retries
  timeout                = var.timeout
  max_capacity           = var.max_capacity

  command {
    name               = var.job_type_name
    script_location    = var.labware8_to_raw_script_location
    python_version     = var.python_version
}
  default_arguments = {
    "--additional-python-modules" = var.additional_python_modules != [] ? join(",", var.additional_python_modules) : null,
    "--enable-glue-datacatalog"   = var.enable_glue_datacatalog ? "" : null
   # "--continuous-log-logGroup"  = aws_cloudwatch_log_group.gluelog.name
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-continuous-log-filter"  = "true"
    "--enable-metrics"    = ""
    "--extra-py-files"               = length(var.extra_py_files) > 0 ? join(",", var.extra_py_files) : null
    "--TempDir"                   = length(var.temp_dir) > 0 ? join(",", var.temp_dir) : null
  

}

  execution_property {
    max_concurrent_runs = var.max_concurrent_runs # Limit to one concurrent run
  }
  connections = [aws_glue_connection.example.name]

}
