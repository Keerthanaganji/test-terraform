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

############################################################################################################################
######### postgres_sql_ext#########
############################################################################################
#resource "aws_cloudwatch_log_group" "gluelogsql_ext" {
#  name  = var.log_group_name_sql_ext
#  retention_in_days = var.retention_in_days
#}

resource "aws_glue_job" "postgres_sql_ext" {
  name            = var.postgres_sql_ext
  role_arn        = var.role_arn
  description     = var.description
  max_retries     = var.max_retries
  timeout         = var.timeout
  max_capacity    = var.max_capacity

  command {
    name       = var.job_type_name
    script_location    = var.postgres_sql_ext_script_location
    python_version     = var.python_version
}
  default_arguments = {
    "--additional-python-modules" = var.additional_python_modules != [] ? join(",", var.additional_python_modules) : null,
    "--enable-glue-datacatalog"   = var.enable_glue_datacatalog ? "" : null
  #  "--continuous-log-logGroup"   = aws_cloudwatch_log_group.gluelogsql_ext.name
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
############################################################################################################################
######### postgres_sql#########
############################################################################################
#resource "aws_cloudwatch_log_group" "gluelogsql" {
#  name  = var.log_group_name_sql
#  retention_in_days = var.retention_in_days
#}

resource "aws_glue_job" "postgres_sql" {
  name            = var.postgres_sql
  role_arn        = var.role_arn
  description     = var.description
  max_retries     = var.max_retries
  timeout         = var.timeout
  max_capacity    = var.max_capacity

  command {
    name       = var.job_type_name
    script_location    = var.postgres_sql_script_location
    python_version     = var.python_version
}
  default_arguments = {
    "--additional-python-modules" = var.additional_python_modules != [] ? join(",", var.additional_python_modules) : null,
    "--enable-glue-datacatalog"   = var.enable_glue_datacatalog ? "" : null
  #  "--continuous-log-logGroup"   = aws_cloudwatch_log_group.gluelogsql.name
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

############################################################################################################################
######### datahub_to_ref #########
############################################################################################

resource "aws_glue_job" "datahub_to_ref" {
  name                   = var.datahub_to_ref
  role_arn               = var.role_arn
  description            = var.description
  max_retries            = var.max_retries
  timeout                = var.timeout
  max_capacity           = var.max_capacity

  command {
    name               = var.job_type_name
    script_location    = var.datahub_to_ref_script_location
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

############################################################################################################################
######### purging_script #########
############################################################################################

resource "aws_glue_job" "purging_script" {
  name                   = var.purging_script
  role_arn               = var.role_arn
  description            = var.description
  max_retries            = var.max_retries
  timeout                = var.timeout
  max_capacity           = var.max_capacity

  command {
    name               = var.job_type_name
    script_location    = var.purging_script_location
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

############################################################################################################################
######### postgres_create_table #########
############################################################################################

resource "aws_glue_job" "postgres_create_table" {
  name                   = var.postgres_create_table
  role_arn               = var.role_arn
  description            = var.description
  max_retries            = var.max_retries
  timeout                = var.timeout
  max_capacity           = var.max_capacity

  command {
    name               = var.job_type_name
    script_location    = var.postgres_create_table_script_location
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

############################################################################################################################
######### db_files_to_s3_upload #########
############################################################################################

resource "aws_glue_job" "db_files_to_s3_upload" {
  name                   = var.db_files_to_s3_upload
  role_arn               = var.role_arn
  description            = var.description
  max_retries            = var.max_retries
  timeout                = var.timeout
  max_capacity           = var.max_capacity

  command {
    name               = var.job_type_name
    script_location    = var.db_files_to_s3_upload_script_location
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

############################################################################################################################
######### usage_res_study_attachments #########
############################################################################################

resource "aws_glue_job" "usage_res_study_attachments" {
  name                   = var.usage_res_study_attachments
  role_arn               = var.role_arn
  description            = var.description
  max_retries            = var.max_retries
  timeout                = var.timeout
  max_capacity           = var.max_capacity

  command {
    name               = var.job_type_name
    script_location    = var.usage_res_study_attachments_script_location
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

############################################################################################################################
######### glue triggers #########
############################################################################################

resource "aws_glue_trigger" "labware8_to_raw_dataload_trigger" {
  name = "labware8_to_raw_dataload_trigger"
  type = "ON_DEMAND"

  actions {
    job_name = var.glue_job_name
    arguments = {
      "--object_key"       = "configuration/job/raw/labware8/data_extract_to_raw_process_config.yaml"
      "--max_workers_key"  = "5"
      "--bucket_key"       = "az-hbs-bank-dm-artifacts-test"
    }
  }
}

resource "aws_glue_trigger" "raw_to_stg_dataload_trigger" {
  name = "raw_to_stg_dataload_trigger"
  type = "ON_DEMAND"

  actions {
    job_name = var.postgres_sql
    arguments = {
      "--object_key"       = "configuration/job/stg/labware8/sql_raw_to_stg_process_config.yaml"
      "--max_workers_key"  = "5"
      "--bucket_key"       = "az-hbs-bank-dm-artifacts-test"
    }
  }
}

resource "aws_glue_trigger" "stg_to_trn_dataload_trigger" {
  name = "stg_to_trn_dataload_trigger"
  type = "ON_DEMAND"

  actions {
    job_name = var.postgres_sql
    arguments = {
      "--object_key"       = "configuration/job/trn/labware8/sql_stg_to_trn_process_config.yaml"
      "--max_workers_key"  = "5"
      "--bucket_key"       = "az-hbs-bank-dm-artifacts-test"
    }
  }
}

resource "aws_glue_trigger" "trn_to_ext_dataload_trigger" {
  name = "trn_to_ext_dataload_trigger"
  type = "ON_DEMAND"

  actions {
    job_name = var.postgres_sql_ext
    arguments = {
      "--object_key"       = "configuration/job/ext/sql_trn_to_ext_process_config.yaml"
      "--max_workers_key"  = "5"
      "--bucket_key"       = "az-hbs-bank-dm-artifacts-test"
    }
  }
}

resource "aws_glue_trigger" "create_usage_res_notes_trigger" {
  name = "create_usage_res_notes_trigger"
  type = "ON_DEMAND"

  actions {
    job_name = var.usage_res_study_attachments
    arguments = {
      "--object_key"       = "configuration/job/ext/usage_res_study_attachments.yaml"
      "--max_workers_key"  = "5"
      "--bucket_key"       = "az-hbs-bank-dm-artifacts-test"
    }
  }
}

resource "aws_glue_trigger" "db_files_to_s3_upload_trigger" {
  name = "db_files_to_s3_upload_trigger"
  type = "ON_DEMAND"

  actions {
    job_name = var.db_files_to_s3_upload
    arguments = {
      "--object_key"       = "configuration/job/ext/db_files_to_s3_config.yaml"
      "--max_workers_key"  = "5"
      "--bucket_key"       = "az-hbs-bank-dm-artifacts-test"
    }
  }
}

resource "aws_glue_trigger" "datahub_to_ref_dataload_trigger" {
  name = "datahub_to_ref_dataload_trigger"
  type = "ON_DEMAND"

  actions {
    job_name = var.datahub_to_ref
    arguments = {
      "--object_key"       = "configuration/job/ref/datahub/datahub_extract_to_ref_process_config.yaml"
      "--max_workers_key"  = "5"
      "--bucket_key"       = "az-hbs-bank-dm-artifacts-test"
    }
  }
}

resource "aws_glue_trigger" "raw_create_table_trigger" {
  name = "raw_create_table_trigger"
  type = "ON_DEMAND"

  actions {
    job_name = var.postgres_create_table
    arguments = {
      "--object_key"       = "configuration/job/raw/labware8/create_sql_raw_process_config.yaml"
      "--max_workers_key"  = "5"
      "--bucket_key"       = "az-hbs-bank-dm-artifacts-test"
    }
  }
}

resource "aws_glue_trigger" "stg_create_table_trigger" {
  name = "stg_create_table_trigger"
  type = "ON_DEMAND"

  actions {
    job_name = var.postgres_create_table
    arguments = {
      "--object_key"       = "configuration/job/stg/labware8/create_sql_stg_process_config.yaml"
      "--max_workers_key"  = "5"
      "--bucket_key"       = "az-hbs-bank-dm-artifacts-test"
    }
  }
}

resource "aws_glue_trigger" "trn_create_table_trigger" {
  name = "trn_create_table_trigger"
  type = "ON_DEMAND"

  actions {
    job_name = var.postgres_create_table
    arguments = {
      "--object_key"       = "configuration/job/trn/labware8/create_sql_trn_process_config.yaml"
      "--max_workers_key"  = "5"
      "--bucket_key"       = "az-hbs-bank-dm-artifacts-test"
    }
  }
}

resource "aws_glue_trigger" "ref_create_table_trigger" {
  name = "ref_create_table_trigger"
  type = "ON_DEMAND"

  actions {
    job_name = var.postgres_create_table
    arguments = {
      "--object_key"       = "configuration/job/ref/datahub/create_sql_ref_process_config.yaml"
      "--max_workers_key"  = "5"
      "--bucket_key"       = "az-hbs-bank-dm-artifacts-test"
    }
  }
}

resource "aws_glue_trigger" "purging_script_trigger" {
  name = "purging_script_trigger"
  type = "ON_DEMAND"

  actions {
    job_name = var.purging_script
    arguments = {
      "--object_key"       = "configuration/job/ref/datahub/purge_script_process_config.yaml"
      "--max_workers_key"  = "5"
      "--bucket_key"       = "az-hbs-bank-dm-artifacts-test"
    }
  }
}
