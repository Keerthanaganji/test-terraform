provider "aws" {
  region = var.region
}

module "aws_s3_bucket" {
  source = "../../modules/s3_bucket"

  bucket_name = var.bucket_name
}
#####################################################################################
### Postgress ####
########################################################################################
module "aws_db_instance"{
  source = "../../modules/postgres"

  db_name             = var.db_name
  db_password         = var.db_password
  db_engine_version   = var.db_engine_version
  master_name         = var.master_name
  deletion_protection = var.deletion_protection
  network_type        = var.network_type
  cluster_id          = var.cluster_id
}
######################################################################################################
### glue Job ###
####################################################################################################

module "my_glue_job" {
  source = "../../modules/glue_job"

  name                   = var.full_name
  role_arn               = var.create_role 
  connections            = var.connections
  description            = var.description
  glue_version           = var.glue_version
  max_retries            = var.max_retries
  timeout                = var.timeout
  worker_type            = var.worker_type
  number_of_workers      = var.number_of_workers
 }

