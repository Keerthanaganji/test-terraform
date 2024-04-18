################################################################################
# PostgreSQL Serverless v2
################################################################################

data "aws_rds_engine_version" "postgresql" {
  engine  = var.engine
  engine_version = var.engine_version
}

module "aurora_postgresql_v2" {
  source = "../../module/postgres"

  db_name           = var.db_name
  engine            = var.engine
  engine_mode       = var.engine_mode
  engine_version    = var.engine_version
  storage_encrypted = true
  master_username   = var.master_username

  vpc_id               = var.vpc_id
  db_subnet_group_name = var.db_subnet_group_name
  security_group_rules = {
    vpc_ingress = {
      cidr_blocks = var.private_subnets_cidr_blocks
    }
  }

  monitoring_interval = 60

  apply_immediately   = true
  skip_final_snapshot = true

  serverlessv2_scaling_configuration = {
    min_capacity = 2
    max_capacity = 10
  }

  instance_class = "db.serverless"
  instances = {
    one = {}
    two = {}
  }
