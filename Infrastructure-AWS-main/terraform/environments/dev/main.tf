provider "aws" {
  region = var.region
}

module "aws_s3_bucket" {
  source = "../../modules/s3_bucket"

  bucket_name = var.bucket_name
}

######################################################################################################
### glue Job ###
####################################################################################################

module "aws_glue_job" {
  source = "../../modules/glue_job"

  name              = var.name
  role_arn               = var.role_arn
  connections            = var.connections
  description            = var.description
  glue_version           = var.glue_version
  max_retries            = var.max_retries
  timeout                = var.timeout
  security_configuration = var.security_configuration
  worker_type            = var.worker_type
  number_of_workers      = var.number_of_workers
  script_location = var.script_location 
  python_version  = var.python_version
 }

################################################################################
# PostgreSQL Serverless v2
################################################################################
module "aurora_postgresql_v2" {
  source = "../../modules/postgres"

  database_name           = var.database_name
  engine            = var.engine
  engine_mode       = var.engine_mode
  engine_version    = var.engine_version
  master_username   = var.master_username
  id                = var.id
  db_subnet_group_name = var.db_subnet_group_name
  cidr_block        = var.cidr_block
  allocated_storage = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  monitoring_interval = var.monitoring_interval
  apply_immediately   = var.apply_immediately
  skip_final_snapshot = var.skip_final_snapshot
}
  

