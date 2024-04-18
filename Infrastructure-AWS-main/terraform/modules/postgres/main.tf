resource "aws_rds_cluster" "postgresql" {
  cluster_identifier      = var.cluster_identifier
  database_name           = var.db_name
  engine                  = var.engine
  engine_mode             = var.engine_mode
  engine_version          = var.engine_version
  master_username         = var.master_username
  storage_encrypted       = var.storage_encrypted
  vpc_id                  = var.vpc_id
  db_subnet_group_name    = var.db_subnet_group_name
  monitoring_interval     = var.monitoring_interval
  apply_immediately       = var.apply_immediately
  skip_final_snapshot     = var.skip_final_snapshot
  deletion_protection     = var.deletion_protection
  min_capacity            = var.min_capacity
  max_capacity            = var.max_capacity
}
