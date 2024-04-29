provider "aws" {
  region = var.region
}

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

 # name              = var.name
 # connections            = var.connections
#  description            = var.description
#  glue_version           = var.glue_version
#  max_retries            = var.max_retries
#  timeout                = var.timeout
#  security_configuration = var.security_configuration
#  worker_type            = var.worker_type
#  number_of_workers      = var.number_of_workers
 # script_location = var.script_location 
#  python_version  = var.python_version
#}

################################################################################
# RDS Aurora Module
################################################################################

module "postgres_cluster" {
  source = "../../modules/postgres"

  cluster_name             = "my-postgres-cluster"
  allocated_storage        = 100
  instance_class           = "db.t3.medium"
  engine                   = "aurora-postgresql"
  engine_version           = "10.14"
  vpc_id                   = "vpc-07832f2f1eb8d75eb"   # Provide your existing VPC ID here
  subnet_ids               = ["subnet-03a665b3db2978814", "subnet-0731f902c06ec204c"]  # Provide your existing subnet IDs here
  security_group_ids       = ["sg-030c0f8e77df31572", "sg-028f561ebcf411e7a"]  # Provide your existing security group IDs here
}

