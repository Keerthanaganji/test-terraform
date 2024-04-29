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

module "vpc" {
  source  = "../../modules/postgres"

  name                 = "demovpc"
  cidr                 = "10.0.0.0/16"
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}
module "subnets" {
  source             = "../../modules/postgres"
  vpc_id             = aws_vpc.main.id
  count              = 3
  cidr_blocks        = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  availability_zones = ["us-west-1a", "us-west-1b", "us-west-1c"]
}

