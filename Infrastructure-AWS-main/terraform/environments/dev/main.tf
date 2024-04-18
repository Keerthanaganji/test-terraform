provider "aws" {
  region = var.region
}

module "aws_s3_bucket" {
  source = "../../modules/s3_bucket"

  bucket_name = var.bucket_name
}

### Postgress ####

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

### glue Job ###

module "my_glue_job" {
  source = "./modules/glue_job"

  name                   = "my-glue-job"
  connections            = ["connection1", "connection2"]
  description            = "My Glue job description"
  glue_version           = "1.0"
  max_retries            = 3
  timeout                = 60
  create_security_configuration = true
  worker_type            = "G.1X"
  number_of_workers      = 2
 

