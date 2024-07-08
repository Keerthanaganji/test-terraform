terraform/modules/glue_job/variables.tf

variable "region" {
  description = "The AWS region"
  type        = string
}

variable "description" {
  description = "The description of the Glue job"
}

variable "max_retries" {
  description = "The maximum number of times to retry the job if it fails"
}

variable "timeout" {
  description = "The job timeout in minutes"
}

variable "glue_job_name" {
  description = "The name of the Glue job"
}
#variable "log_group_name" {
#  description = "The name of the cloudwatch log"
#}
variable "job_type_name" {
  description = "The name of thejob type "
}
variable "glue_connection_name" {
  description = "The name of the Glue connection"
}

variable "role_arn" {
  type     = string
  default  = ""
}

#variable "retention_in_days" {
#  type   = number
#  default = 7
#}

variable "labware8_to_raw_script_location" {
  description = "The labware8_to_raw S3 path to the script that the Glue job runs"
}

variable "postgres_sql_ext_script_location" {
  description = "The postgres_sql_ext S3 path to the script that the Glue job runs"
}

variable "postgres_sql_script_location" {
  description = "The postgres_sql S3 path to the script that the Glue job runs"
}

variable "datahub_to_ref_script_location" {
  description = "The datahub_to_ref S3 path to the script that the Glue job runs"
}

variable "purging_script_location" {
  description = "The purging_script S3 path to the script that the Glue job runs"
}

variable "postgres_create_table_script_location" {
  description = "The postgres_create_table S3 path to the script that the Glue job runs"
}

variable "db_files_to_s3_upload_script_location" {
  description = "The postgres_create_table S3 path to the script that the Glue job runs"
}

variable "usage_res_study_attachments_script_location" {
  description = "The postgres_create_table S3 path to the script that the Glue job runs"
}


variable "python_version" {
  description = "The Python version being used to execute a Python shell job."

}

variable "enable_glue_datacatalog" {
  type   = bool
  default  = true
  description = "(Optional) Eanables you to use AWS glue Data Catalog as Hive Metastore."
}

variable "additional_python_modules" {
  type     = list(string)
  default  = ["oracledb==1.4.2", "psycopg2-binary", "snowflake-connector-python"]
  description  = "(Optional) List of Python modules to add a new module or change the version of existing module."
}

variable "glue_subnet_id" {
  type   = string
}
variable "glue_security_group_id_list" {
  type  = list(string)
}
variable "connection_type" {
  type  = string
}
variable "max_capacity" {
  type  = number
}
variable "max_concurrent_runs" {
  type  = number
}
variable "availability_zone" {
  type  = string
}
variable "postgres_sql_ext" {
  description = "The name of the Glue job"
}
#variable "log_group_name_sql_ext" {
#  description = "The name of the cloudwatch log"
#}
variable "postgres_sql" {
  description = "The name of the Glue job"
}
#variable "log_group_name_sql" {
#  description = "The name of the cloudwatch log"
#}

variable "datahub_to_ref" {
  description = "The name of the Glue job"
}

variable "purging_script" {
  description = "The name of the Glue job"
}

variable "postgres_create_table" {
  description = "The name of the Glue job"
}

variable "db_files_to_s3_upload" {
  description = "The name of the Glue job"
}

variable "usage_res_study_attachments" {
  description = "The name of the Glue job"
}


variable "extra_py_files" {
  type     = list(string)
}
variable "temp_dir" {
  type     = list(string)
}
