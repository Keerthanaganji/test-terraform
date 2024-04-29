resource "aws_rds_cluster" "testcluster" {
  cluster_identifier      = var.cluster_name
  allocated_storage       = var.allocated_storage
  db_cluster_parameter_group_name = "my_db_cluster_parameter_group"
  db_subnet_group_name    = var.db_subnet_group_name
  vpc_security_group_ids  = var.security_group_ids

  engine           = var.engine
  engine_version   = var.engine_version
  db_cluster_identifier_prefix = var.cluster_name
  db_cluster_instance_class    = var.instance_class
}
