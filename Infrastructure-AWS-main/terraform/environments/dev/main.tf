provider "aws" {
  region = var.region
}

#module "s3_bucket" {
#  source = "../../modules/s3_bucket"
 
#  bucket_name_first = var.bucket_name_first
#  bucket_name_second = var.bucket_name_second
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

module "postgresql" {
  source  = "../../modules/postgres"

  db_subnet_group_name           = "my-db-subnet-group"
  vpc_id                         = "vpc-07832f2f1eb8d75eb"
  db_subnet_group_subnet_ids     = ["subnet-03a665b3db2978814","subnet-0731f902c06ec204c"]
  allocated_storage              = 20
  engine                         = "postgres"
  engine_version                 = "12.4"
  instance_class                 = "db.t3.medium"
  name                           = "my-postgresql"
  username                       = "postgres"
  password                       = "your_password"
  publicly_accessible            = false
  skip_final_snapshot            = true
}



  

