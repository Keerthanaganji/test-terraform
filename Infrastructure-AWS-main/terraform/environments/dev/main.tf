provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source = "../../modules/s3_bucket"
 
  bucket_name_first = var.bucket_name_first
  bucket_name_second = var.bucket_name_second
}

######################################################################################################
### glue Job ###
####################################################################################################

module "aws_glue_job" {
  source = "../../modules/glue_job"

  name              = var.name
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

######################################################################################################
### post gress ###
################################################################################################
module "postgresql_cluster" {
  source = "../../modules/postgres"

  db_subnet_group_name   = "my-db-subnet-group"
  subnet_ids             = ["subnet-0c6df1696416a3fb4"]
  security_group_name    = "testvpckey"
  vpc_id                 = "vpc-0c62dcc69ca138dc0"
  db_instance_identifier = "my-postgresql-db"
}


  

