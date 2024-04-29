resource "aws_rds_cluster" "testcluster" {
  cluster_identifier      = var.cluster_name
  allocated_storage       = var.allocated_storage
  db_cluster_parameter_group_name = "my_db_cluster_parameter_group"
  db_subnet_group_name    = "my_db_subnet_group"
  vpc_security_group_ids  = var.security_group_ids

  engine           = var.engine
  engine_version   = var.engine_version
  db_cluster_instance_class    = var.instance_class
}

resource "aws_db_subnet_group" "postgres_subnet_group" {
  name        = "my_db_subnet_group"
  description = "DB subnet group for PostgreSQL"
  subnet_ids  = ["subnet-03a665b3db2978814", "subnet-0731f902c06ec204c"]
}
