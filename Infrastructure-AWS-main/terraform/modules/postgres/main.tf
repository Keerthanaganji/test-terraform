resource "aws_rds_cluster" "example_cluster" {
  cluster_identifier        = var.db_cluster_identifier
  database_name             = "example_db"
  engine                    = var.db_engine
  engine_version            = var.db_engine_version
  master_username           = var.db_master_username
  master_password           = var.db_master_password
  skip_final_snapshot       = true

  vpc_security_group_ids    = var.vpc_security_group_ids
  db_subnet_group_name      = aws_db_subnet_group.example_subnet_group.name

  tags = {
    Name = "Example RDS Cluster"
  }
}

resource "aws_db_subnet_group" "example_subnet_group" {
  name       = "example-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "Example Subnet Group"
  }
}

resource "aws_rds_cluster_instance" "example_instance" {
  cluster_identifier        = aws_rds_cluster.example_cluster.id
  identifier       = var.db_instance_identifier
  instance_class            = var.db_instance_class
  engine                    = var.db_engine
  engine_version            = var.db_engine_version

  tags = {
    Name = "Example RDS Instance"
  }
}
