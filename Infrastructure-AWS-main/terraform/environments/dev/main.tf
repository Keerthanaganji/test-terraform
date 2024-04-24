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

######################################################################################################
### post gress ###
################################################################################################
module "postgresql_cluster" {
  source = "../../modules/postgres"

  cluster_identifier      = "demo-cluster-member-1"
  engine                  = "aurora-postgresql"
  vpc_security_group_ids  = "vpc-07832f2f1eb8d75eb"
  db_subnet_group_name    = "my-db-subnet-group"
  count                   = 2
  identifier              = "demo-cluster-member-instance-${count.index + 1}"
  instance_class          = "db.r5.large"
  name                    = "clustervpc"
  vpc_id           = "vpc-07832f2f1eb8d75eb"
  group_name       = "clustergroup"
  subnet_ids = ["subnet-03a665b3db2978814","subnet-0731f902c06ec204c"]
  
}


  

