data "aws_rds_engine_version" "postgresql" {
  engine  = "aurora-postgresql"
  version = "14.5"
}

module "aurora_postgresql_v2" {
  source = "../../"

  name              = "postgresqlv2"
  engine            = aws_rds_engine_version.postgresql.engine
  engine_mode       = "provisioned"
  engine_version    = aws_rds_engine_version.postgresql.version
  storage_encrypted = true
  master_username   = "root"

  vpc_id               = module.vpc.vpc_id
  db_subnet_group_name = module.vpc.database_subnet_group_name
  security_group_rules = {
    vpc_ingress = {
      cidr_blocks = module.vpc.private_subnets_cidr_blocks
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
