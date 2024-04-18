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
  engine_version    = var.engine_version
  storage_encrypted = true
  master_username   = var.master_username
  vpc_security_group_ids  = var.vpc_id
  db_subnet_group_name = var.db_subnet_group_name
  security_group_rules = {
    vpc_ingress = {
      cidr_blocks = var.cidr_blocks
    }
  }

  monitoring_interval = 60

  apply_immediately   = true
  skip_final_snapshot = true

  serverlessv2_scaling_configuration = {
    min_capacity = 2
    max_capacity = 10
  }

  instance_class = "db.serverless"
  instances = {
    one = {}
    two = {}
  }
}

