provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source = "../../modules/s3_bucket"

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name_first
}
  
} 
resource "aws_s3_bucket_acl" "example" {
  bucket = module.s3_bucket.bucket_id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = module.s3_bucket.bucket_id
  versioning_configuration {
    status = "Enabled"
  }
}
#### Postgress ####
provider "aws" {
  region = var.region
}

module "postgres_instance" {
  source = "../../modules/postgres_instance"

  db_name            = var.db_name
  password           = var.db_password
  db_instance_arn    = var.db_instance_arn
  db_engine_version  = var.db_engine_version
  db_parameter_group = var.db_parameter_group
  master_name        = var.master_name
  role_arn           = var.role_arn
  cluster_identifier = var.cluster_identifier
  deletion_protection = var.deletion_protection
  network_type   = var.network_type
}


