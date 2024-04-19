resource "aws_rds_cluster" "postgresql" {
  cluster_identifier  = "aurara_cluster"
  database_name           = var.database_name
  engine            = var.engine
  engine_mode       = var.engine_mode
  engine_version    = var.engine_version
  master_username   = var.master_username

  id               = var.id
  db_subnet_group_name = var.db_subnet_group_name



  apply_immediately   = var.apply_immediately
  skip_final_snapshot = var.skip_final_snapshot

 scaling_configuration {
    min_capacity = "1"
    max_capacity = "8"
  }
}

resource "aws_rds_cluster_instance" "aurora_instance"{
  cluster_identifier = "aurora_cluster"
  instance_class = "db.r6g.large"
  identifier   = "aurora_instance"
  monitoring_interval = var.monitoring_interval
  engine            = var.engine
}

resource "aws_vpc" "sggroup"{
  cidr_block = "172.31.0.0/16"
}

resource "aws_subnet" "mysg"{
  vpc_id = "vpc-0c62dcc69ca138dc0"
  cidr_block = "172.31.48.0/20"
  security_group_rules = {
    vpc_ingress = {
      cidr_block = "172.31.48.0/20"
    }
}
}
