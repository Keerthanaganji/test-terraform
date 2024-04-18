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
  role_arn               = var.create_role 
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

  db_name           = var.db_name
  engine            = var.engine
  engine_mode       = var.engine_mode
  version    = var.version
  storage_encrypted = true
  master_username   = var.master_username
  id                = var.id
  db_subnet_group_name = var.db_subnet_group_name
  cidr_blocks         = var.cidr_blocks
  min_capacity = var.min_capacity
  max_capacity = var.max_capacity
  monitoring_interval = var.monitoring_interval
  apply_immediately   = var.apply_immediately
  skip_final_snapshot = var.skip_final_snapshot
  instance_class = var.instance_class
}
  

