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

module "aurora" {
  source = "../../"

  name            = local.name
  engine          = "aurora-postgresql"
  engine_version  = "14.7"
  master_username = "root"
  storage_type    = "aurora-iopt1"
  instances = {
    1 = {
      instance_class          = "db.r5.2xlarge"
      publicly_accessible     = true
      db_parameter_group_name = "default.aurora-postgresql14"
    }
    2 = {
      identifier     = "static-member-1"
      instance_class = "db.r5.2xlarge"
    }
    3 = {
      identifier     = "excluded-member-1"
      instance_class = "db.r5.large"
      promotion_tier = 15
    }
  }

  endpoints = {
    static = {
      identifier     = "static-custom-endpt"
      type           = "ANY"
      static_members = ["static-member-1"]
      tags           = { Endpoint = "static-members" }
    }
    excluded = {
      identifier       = "excluded-custom-endpt"
      type             = "READER"
      excluded_members = ["excluded-member-1"]
      tags             = { Endpoint = "excluded-members" }
    }
  }

  vpc_id               = module.vpc.vpc_id
  db_subnet_group_name = module.vpc.database_subnet_group_name
  security_group_rules = {
    vpc_ingress = {
      cidr_blocks = module.vpc.private_subnets_cidr_blocks
    }
    egress_example = {
      cidr_blocks = ["10.33.0.0/28"]
      description = "Egress to corporate printer closet"
    }
  }

  apply_immediately   = true
  skip_final_snapshot = true

  create_db_cluster_parameter_group      = true
  db_cluster_parameter_group_name        = local.name
  db_cluster_parameter_group_family      = "aurora-postgresql14"
  db_cluster_parameter_group_description = "${local.name} example cluster parameter group"
  db_cluster_parameter_group_parameters = [
    {
      name         = "log_min_duration_statement"
      value        = 4000
      apply_method = "immediate"
      }, {
      name         = "rds.force_ssl"
      value        = 1
      apply_method = "immediate"
    }
  ]

  create_db_parameter_group      = true
  db_parameter_group_name        = local.name
  db_parameter_group_family      = "aurora-postgresql14"
  db_parameter_group_description = "${local.name} example DB parameter group"
  db_parameter_group_parameters = [
    {
      name         = "log_min_duration_statement"
      value        = 4000
      apply_method = "immediate"
    }
  ]

  enabled_cloudwatch_logs_exports = ["postgresql"]
  create_cloudwatch_log_group     = true

  create_db_cluster_activity_stream     = true
  db_cluster_activity_stream_kms_key_id = module.kms.key_id
  db_cluster_activity_stream_mode       = "async"

  tags = local.tags
}

################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = local.name
  cidr = local.vpc_cidr

  azs              = local.azs
  public_subnets   = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  private_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 3)]
  database_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 6)]

  tags = local.tags
}

module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 2.0"

  deletion_window_in_days = 7
  description             = "KMS key for ${local.name} cluster activity stream."
  enable_key_rotation     = true
  is_enabled              = true
  key_usage               = "ENCRYPT_DECRYPT"

  aliases = [local.name]

  tags = local.tags
}






  

