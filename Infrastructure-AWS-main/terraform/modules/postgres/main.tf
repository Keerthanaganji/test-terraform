resource "aws_rds_cluster" "postgresql" {
  db_name           = var.db_name
  engine            = var.engine
  engine_mode       = var.engine_mode
  engine_version    = var.engine_version
  storage_encrypted = true
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

  serverlessv2_scaling_configuration = {
    min_capacity = var.min_capacity
    max_capacity = var.max_capacity
  }

  instance_class = var.instance_class
  instances = {
    one = {}
    two = {}
  }

}
