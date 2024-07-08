variable "region" {
  description = "The AWS region"
  type        = string
}

terraform/environments/test/variables.tf

#######################################################################################################
###Variables for Buckets#####
##########################################################################################################

variable "artifact_bucket" {
  description = "The name of the artifact bucket"
  type        = string
}

variable "log_bucket" {
  description = "The name of the log bucket"
  type        = string
}

variable "raw_bucket" {
  description = "The name of the raw bucket"
  type        = string
}

variable "processed_bucket" {
  description = "The name of the processed bucket"
  type        = string
}

variable "limfinity_bucket" {
  description = "The name of the limfinity bucket"
  type        = string
}

variable "identifier" {
  description = "The ARN for accessing the limfinity bucket"
  type     = list(string)
}

#######################################################################################################
### Variables for glue_job#####
##########################################################################################################
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

variable "description" {
  description = "The description of the Glue job"
}

variable "timeout" {
  description = "The job timeout in minutes"
}
variable "max_retries" {
  type        = number
  description = "The maximum number of retries for the Glue job"
}

variable "role_arn" {
  type     = string
  default  = ""
}

variable "retention_in_days" {
  type   = number
  default = 7
}

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
  description = "The postgres_sql S3 path to the script that the Glue job runs"
}

variable "purging_script_location" {
  description = "The postgres_sql S3 path to the script that the Glue job runs"
}

variable "postgres_create_table_script_location" {
  description = "The postgres_create_table S3 path to the script that the Glue job runs"
}

variable "db_files_to_s3_upload_script_location" {
  description = "The db_files_to_s3_uploa S3 path to the script that the Glue job runs"
}

variable "python_version" {
  description = "The Python version being used to execute a Python shell job."
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
  type = number
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

variable "extra_py_files" {
  type     = list(string)
}
variable "temp_dir" {
  type     = list(string)
}

variable "usage_res_study_attachments_script_location" {
  description = "The postgres_create_table S3 path to the script that the Glue job runs"
}

variable "usage_res_study_attachments" {
  description = "The name of the Glue job"
}
#######################################################################################################
### Variables for postgres#####
##########################################################################################################

variable "environment" {
  description = "The environment name"
}

variable "cluster_id" {
  description = "The identifier for the DB cluster"
}

variable "engine" {
  description = "The Cluster Engine"
}

variable "engine_mode" {
  description = "The Cluster engine_mode"
}

variable "engine_version" {
  description = "The Cluster engine_version"
}

variable "database_name" {
  description = "The Cluster database_name"
}

variable "master_username" {
  description = "The Cluster master_username"
}

variable "db_subnet_group_name" {
  description = "The Cluster db_subnet_group_name"
}

variable "postgresql_subnet_group_ids" {
  description = "The postgresql_subnet_group_ids"
  type = list(string)
}

variable "vpc_security_group_ids" {
  description = "The Cluster vpc_security_group_ids"
  type = list(string)
}

variable "enabled_cloudwatch_logs_exports" {
  description = "The Cluster enabled_cloudwatch_logs_exports"
  type = list(string)
}

variable "db_parameter_group_name" {
  description = "The Cluster db_parameter_group_name"
}

#######################################################################################################
###Variables for Athena#####
##########################################################################################################
variable "athena_bucket" {
  description = "The name of the athena bucket"
  type        = string
}

variable "workgroup_name" {
  description = "The name of the workgroup name"
  type        = string
}
variable "database" {
  type        = string
  description = "Name of the database"
}

variable "gluerole" {
  type        = string
  description = "Glure role ARN for Athena"
}

variable "crawlerbucketpath" {
  type        = string
  description = "Bucket path for crawler to create tables"
}

#######################################################################################################
###Variables for SecretsManager#####
##########################################################################################################

variable "postgres_hbs_bank_db" {
  description = "Secrets for the postgres_hbs_bank_db"
  type        = string
}

variable "postgres_description" {
  description = "The description for secrets"
  type        = string
}

variable "postgres_tags" {
  description = "A map of tags to assign to the secret"
  type        = map(string)
}

variable "postgres_username" {
  description = "The username for the secret"
  type        = string
}

variable "postgres_password" {
  description = "The password for the secret"
  type        = string
}

variable "postgres_engine" {
  description = "The postgres_engine"
  type        = string
}

variable "postgres_host" {
  description = "The postgres_host"
  type        = string
}

variable "postgres_port" {
  description = "The port for the DB"
  type        = string
}

variable "postgres_dbClusterIdentifier" {
  description = "The postgres_dbClusterIdentifier"
  type        = string
}

variable "postgres_database" {
  description = "The postgres_database"
  type        = string
}

# oracle_abba variables

variable "oracle_abba_db" {
  description = "Secrets for the oracle_abba_db"
  type        = string
}

variable "oracle_abba_description" {
  description = "The description for oracle_abba secrets"
  type        = string
}

variable "oracle_abba_tags" {
  description = "A map of tags to assign to the secret"
  type        = map(string)
}

variable "oracle_abba_username" {
  description = "The username for the secret"
  type        = string
}

variable "oracle_abba_password" {
  description = "The password for the secret"
  type        = string
}

variable "oracle_abba_engine" {
  description = "The postgres_engine"
  type        = string
}

variable "oracle_abba_host" {
  description = "The postgres_host"
  type        = string
}

variable "oracle_abba_port" {
  description = "The port for the DB"
  type        = string
}

variable "oracle_abba_database" {
  description = "The oracle_abba_database name"
  type        = string
}

# datahub Variables

variable "data_hub_db" {
  description = "The data_hub_db name"
  type        = string
}

variable "data_hub_db_description" {
  description = "The data_hub_db description"
  type        = string
}

variable "data_hub_db_tags" {
  description = "The data_hub_db_tags"
  type        = map(string)
}

variable "datahub_rsa_key" {
  description = "The datahub_rsa_key"
  type        = list(string)
}

variable "datahub_user" {
  description = "The datahub_user"
  type        = string
}

variable "datahub_account" {
  description = "The datahub_account"
  type        = string
}

variable "datahub_warehouse" {
  description = "The datahub_warehouse name"
  type        = string
}

variable "datahub_database" {
  description = "The datahub_database name"
  type        = string
}

variable "datahub_schema" {
  description = "The datahub_schema name"
  type        = string
}

variable "datahub_role" {
  description = "The datahub_role name"
  type        = string
}

#variable "datahub_passphrase" {
 # description = "The datahub_passphrase name"
 # type        = string
#}


#######################################################################################################
#### Variables for Creation of Endpoint#####
##########################################################################################################


variable "vpc_id" {
  description = "The vpc_id for Endpoint Creation"
  type        = string
}

variable "service_name_endpoint" {
  description = "The service_name for Endpoint Creation"
  type        = string
}

variable "subnet_ids_endpoint" {
  description = "The subnet_ids for Endpoint Creation"
  type  = list(string)
}

variable "security_group_ids_endpoints" {
  description = "The security_group_ids for Endpoint Creation"
  type  = list(string)
}

#######################################################################################################
#### Variables for Creation of Route53 Records#####
##########################################################################################################

variable "snowflake_url" {
  description = "The snowflake_url for Route53 Record Creation"
  type        = string
}

variable "ocsp_snowflake_url" {
  description = "The ocsp_snowflake_url for Route53 Record Creation"
  type        = string
}

variable "dns_record" {
  description = "The dns_record for Route53 Record Creation"
  type  = list(string)
}
