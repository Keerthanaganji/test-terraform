provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source = "../../modules/s3_bucket"

  bucket_name_first = var.bucket_name_first
  bucket_name_second = var.bucket_name_second
  
} 
#### Postgress ####
provider "aws" {
  region = var.region
}

module "postgres_instance" {
  source = "../../modules/postgres_instance"

  instance_identifier = var.db_instance_identifier
  db_name            = var.db_name
  username           = var.db_username
  password           = var.db_password
  db_instance_arn    = var.db_instance_arn
  db_engine_version  = var.db_engine_version
  db_parameter_group = var.db_parameter_group
  master_name        = var.master_name
  role_arn           = var.role_arn
}


