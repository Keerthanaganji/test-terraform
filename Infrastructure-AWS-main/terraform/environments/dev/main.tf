provider "aws" {
  region = var.region
}

module "aws_s3_bucket" {
  source = "../../modules/s3_bucket"

  bucket = var.raw_bucket_name
  bucket = var.artifact_bucket_name
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

  

