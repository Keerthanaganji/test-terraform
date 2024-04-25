provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source = "../../modules/s3_bucket"
 
  bucket_name_first = var.bucket_name_first
  bucket_name_log = var.bucket_name_log
}

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

module "postgresql_rds_cluster" {
  source  = "../../modules/postgres"

  db_cluster_identifier  = "example-cluster"
  db_instance_identifier = "example-instance"
  db_engine              = "aurora"
  db_engine_version      = "15.4"
  db_instance_class      = "db.t2.medium"
  db_master_username     = "admin"
  db_master_password     = "password"
  vpc_security_group_ids = ["sg-030c0f8e77df31572",]
  subnet_ids             = ["subnet-03a665b3db2978814", "subnet-0731f902c06ec204c"]
}





  

