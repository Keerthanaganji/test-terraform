provider "aws" {
  region = var.region
}
######################################################################################################
### Secret Manager ###
####################################################################################################

#module "secret_manager" {
#   source      = "../../modules/secret_manager"
#   postgres_hbs_bank_db = var.postgres_hbs_bank_db
#   postgres_description = var.postgres_description
#   postgres_tags        = var.postgres_tags
#   postgres_username = var.postgres_username
#   postgres_password = var.postgres_password
#   postgres_engine = var.postgres_engine
#   postgres_host  = var.postgres_host
#   postgres_port     = var.postgres_port
#   postgres_dbClusterIdentifier = var.postgres_dbClusterIdentifier
#   postgres_database  = var.postgres_database
#   region = var.region

#  oracle_abba_db = var.oracle_abba_db
#   oracle_abba_description = var.oracle_abba_description
#   oracle_abba_tags        = var.oracle_abba_tags
#   oracle_abba_username = var.oracle_abba_username
#   oracle_abba_password = var.oracle_abba_password
#   oracle_abba_engine = var.oracle_abba_engine
#   oracle_abba_host  = var.oracle_abba_host
#   oracle_abba_port     = var.oracle_abba_port
#   oracle_abba_database  = var.oracle_abba_database

#    data_hub_db = var.data_hub_db
#    data_hub_db_description = var.data_hub_db_description
#    data_hub_db_tags = var.data_hub_db_tags
#    datahub_rsa_key = var.datahub_rsa_key
#    datahub_user = var.datahub_user
#    datahub_account = var.datahub_account
#    datahub_warehouse = var.datahub_warehouse
#    datahub_database =var.datahub_database
#    datahub_schema = var.datahub_schema
#    datahub_role = var.datahub_role
#    datahub_passphrase = var.datahub_passphrase

#}

######################################################################################################
### S3 Bucket ###
####################################################################################################

#module "s3_bucket" {
#  source         = "../../modules/s3_bucket"
#  artifact_bucket    = var.artifact_bucket
#  limfinity_bucket   = var.limfinity_bucket
#  raw_bucket   = var.raw_bucket
#  log_bucket = var.log_bucket
#  processed_bucket = var.processed_bucket
#  identifier = var.identifier
#  region = var.region
#  environment = var.environment
#}

######################################################################################################
### glue Job ###
####################################################################################################

module "aws_glue_job" {
  source = "../../modules/glue_job"

  glue_job_name           = var.glue_job_name
  region                  = var.region
 # environment = var.environment
  description            = var.description
  max_retries            = var.max_retries
  timeout                = var.timeout
  labware8_to_raw_script_location        = var.labware8_to_raw_script_location
  usage_res_study_attachments  = var.usage_res_study_attachments
  usage_res_study_attachments_script_location = var.usage_res_study_attachments_script_location
  postgres_sql_ext_script_location  = var.postgres_sql_ext_script_location
  postgres_sql_script_location  = var.postgres_sql_script_location
  datahub_to_ref_script_location  = var.datahub_to_ref_script_location
  purging_script_location = var.purging_script_location
  postgres_create_table_script_location = var.postgres_create_table_script_location
  db_files_to_s3_upload_script_location = var.db_files_to_s3_upload_script_location
  python_version          = var.python_version
  #log_group_name          = var.log_group_name
  #retention_in_days      = var.retention_in_days
  glue_connection_name   = var.glue_connection_name    
  connection_type        = var.connection_type
  glue_security_group_id_list = var.glue_security_group_id_list
  glue_subnet_id         = var.glue_subnet_id
  role_arn               = var.role_arn
  job_type_name          = var.job_type_name
  max_concurrent_runs     = var.max_concurrent_runs
  max_capacity             = var.max_capacity
  availability_zone       = var.availability_zone
  postgres_sql_ext         = var.postgres_sql_ext
  datahub_to_ref    = var.datahub_to_ref
  purging_script  = var.purging_script
  postgres_create_table = var.postgres_create_table
  db_files_to_s3_upload = var.db_files_to_s3_upload
  #log_group_name_sql_ext    = var.log_group_name_sql_ext
  postgres_sql           = var.postgres_sql
  #log_group_name_sql        = var.log_group_name_sql
  extra_py_files         = var.extra_py_files
  temp_dir                   = var.temp_dir
}


######################################################################################################
### postgres ###
####################################################################################################

#module "postgres" {
#  source      = "../../modules/postgres"
#  environment = var.environment
#  cluster_id  = var.cluster_id
#  region      = var.region
#  engine                         = var.engine
#  engine_mode                    = var.engine_mode
#  engine_version                 = var.engine_version  # Adjust engine version as per your requirements
#  database_name                  = var.database_name
#  master_username                = var.master_username
## Serverless V2 configuration
#  db_subnet_group_name           = var.db_subnet_group_name

## Specify existing VPC and subnets
#  vpc_security_group_ids          = var.vpc_security_group_ids
#  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
#  db_parameter_group_name         = var.db_parameter_group_name
#  postgresql_subnet_group_ids   = var.postgresql_subnet_group_ids
#}

######################################################################################################
### Athena ###
####################################################################################################

#module "athena" {
#  source      = "../../modules/athena"
#  environment = var.environment
#  athena_bucket = var.athena_bucket
#  workgroup_name  = var.workgroup_name
#  region      = var.region
#  database = var.database
#  gluerole = var.gluerole
#  crawlerbucketpath = var.crawlerbucketpath
#}

######################################################################################################
### Endpoints_route53 ###
####################################################################################################

#module "endpoints" {
#  source      = "../../modules/endpoints"
#  region      = var.region
#  vpc_id      = var.vpc_id
#  service_name_endpoint = var.service_name_endpoint
#  subnet_ids_endpoint  = var.subnet_ids_endpoint
#  security_group_ids_endpoints = var.security_group_ids_endpoints
#}

#module "route53" {
#  source      = "../../modules/route53"
#  region      = var.region
#  vpc_id  = var.vpc_id
#  snowflake_url = var.snowflake_url
#  ocsp_snowflake_url = var.ocsp_snowflake_url
#  dns_record = var.dns_record
#}

#module "iam_roles" {
#  source    = "../../modules/iam_roles"
#}
