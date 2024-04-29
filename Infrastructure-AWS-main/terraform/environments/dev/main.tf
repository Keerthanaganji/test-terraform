#provider "aws" {
#  region = var.region
#}

#module "s3_bucket" {
#  source = "../../modules/s3_bucket"
 
#  bucket_name_first = var.bucket_name_first
#  bucket_name_log = var.bucket_name_log
#}

######################################################################################################
### glue Job ###
####################################################################################################

#module "aws_glue_job" {
#  source = "../../modules/glue_job"

#  name              = var.name
#  connections            = var.connections
#  description            = var.description
#  glue_version           = var.glue_version
#  max_retries            = var.max_retries
#  timeout                = var.timeout
#  security_configuration = var.security_configuration
#  worker_type            = var.worker_type
#  number_of_workers      = var.number_of_workers
# script_location = var.script_location 
#  python_version  = var.python_version
# }
##########################################################################################################

module "vpc" {
  source = "../../modules/postgres"

  cluster_identifier     = "example-cluster"
  db_master_username     = "admin"
  subnet_ids             = ["subnet-12345678", "subnet-23456789", "subnet-34567890"]
  instance_class         = "db.t3.micro"
  master_password        = "admin"
  vpc_security_group_ids = ["sg-12345678"]
  instance_identifier    = "example-instance"
  engine                 = "postgresql"
  engine_version         = "15.14"
}





  

