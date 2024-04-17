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
  name               = var.db_name
  username           = var.db_username
  password           = var.db_password
  instance_class     = var.db_instance_class
  engine_version     = var.db_engine_version
  allocated_storage  = var.db_allocated_storage
  skip_final_snapshot = var.db_skip_final_snapshot

}


