provider "aws" {
  region = var.region
}

resource "aws_db_subnet_group" "postgresql_subnet_group" {
 name = var.db_subnet_group_name
 subnet_ids = var.postgresql_subnet_group_ids
}

resource "aws_rds_cluster" "postgresql_serverless" {
  cluster_identifier             = var.cluster_id
  engine                         = var.engine
  engine_mode                    = var.engine_mode
  engine_version                 = var.engine_version  # Adjust engine version as per your requirements
  database_name                  = var.database_name
  master_username                = var.master_username
  manage_master_user_password    = true

  # Serverless V2 configuration
  db_subnet_group_name           = aws_db_subnet_group.postgresql_subnet_group.name
  serverlessv2_scaling_configuration {
    max_capacity = 8.0
    min_capacity = 0.5
  }
  # Specify existing VPC and subnets
  vpc_security_group_ids         = var.vpc_security_group_ids
  deletion_protection            = false
  apply_immediately              = true
  copy_tags_to_snapshot          = true
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  skip_final_snapshot            = true  # Since deletion_protection is set to false, skipping final snapshot is recommended
  final_snapshot_identifier      = "${var.cluster_id}-final-snapshot"
  db_cluster_parameter_group_name = "default.aurora-postgresql15"
  iam_database_authentication_enabled = true
  storage_encrypted              = true
  tags                           = { Environment = var.environment }
}

resource "aws_rds_cluster_instance" "postgresql_instance" {
  count                          = 1  
  identifier                     = "${var.cluster_id}-instance-${count.index}"
  cluster_identifier             = aws_rds_cluster.postgresql_serverless.id
  instance_class                 = "db.serverless"  # Adjust instance class as per your requirements
  engine                         = var.engine
  publicly_accessible            = false
  performance_insights_enabled   = true
  performance_insights_retention_period = 7  # Adjust retention period as needed
  db_parameter_group_name        = var.db_parameter_group_name
  tags                           = { Environment = var.environment }
}

output "rds_cluster_endpoint" {
  value = aws_rds_cluster.postgresql_serverless.endpoint
}
