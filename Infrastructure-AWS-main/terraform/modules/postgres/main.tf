resource "aws_rds_cluster" "postgresql" {
  cluster_identifier  = "aurara_cluster"
  database_name           = var.database_name
  engine            = var.engine
  engine_mode       = var.engine_mode
  engine_version    = var.engine_version
  master_username   = var.master_username

  id               = var.id
  db_subnet_group_name = var.db_subnet_group_name
  security_group_rules = {
    vpc_ingress = {
      cidr_blocks = var.cidr_blocks
    }
  }

  monitoring_interval = var.monitoring_interval

  apply_immediately   = var.apply_immediately
  skip_final_snapshot = var.skip_final_snapshot

 scaling_configuration = {
    allocated_storage = var.allocated_storage
    max_allocated_storage = var.max_allocated_storage
  }

}

resource "aws_rds_cluster_instance" "aurora_instance"{
  cluster_identifier = "aurora_cluster"
  instance_class = "db.r6g.large"
  identifier   = "aurora_instance"
