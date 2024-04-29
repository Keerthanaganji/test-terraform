resource "aws_rds_cluster" "testcluster" {
  cluster_identifier      = var.cluster_name
  db_cluster_parameter_group_name = "my_db_cluster_parameter_group"
  db_subnet_group_name    = "my_db_subnet_group22"
  vpc_security_group_ids  = var.security_group_ids

  engine           = var.engine
  engine_version   = var.engine_version

  scaling_configuration {
    min_capacity = 1
    max_capacity = 2
    auto_pause   = true
  }
}

