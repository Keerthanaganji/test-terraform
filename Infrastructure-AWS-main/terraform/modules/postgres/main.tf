resource "aws_rds_cluster" "testcluster" {
  cluster_identifier      = var.cluster_name
  db_cluster_parameter_group_name = "my_db_cluster_parameter_group"
  db_subnet_group_name    = "my_db_subnet_group22"
  vpc_security_group_ids  = var.security_group_ids
  master_username              = var.master_username
  master_password              = var.master_password

  engine           = var.engine
  engine_version   = var.engine_version
}

