resource "aws_rds_cluster" "example_cluster" {
  
  db_cluster_identifier  = "example-cluster"
  db_instance_identifier = "instance-example"
  db_engine              = "aurora-postgresql"
  db_engine_version      = "5.6.10a"
  db_instance_class      = "db.t2.medium"
  db_master_username     = "admin"
  db_master_password     = "password"
  skip_final_snapshot       = true

  vpc_security_group_ids    = ["sg-030c0f8e77df31572"]
  db_subnet_group_name      = "demosubnet2"

  tags = {
    Name = "Example RDS Cluster"
  }
}

resource "aws_db_subnet_group" "example_subnet_group" {
  name       = "demosubnet2"
  subnet_ids = ["subnet-03a665b3db2978814","subnet-0731f902c06ec204c"]

  tags = {
    Name = "Example Subnet Group"
  }
}

resource "aws_rds_cluster_instance" "example_instance" {
  db_cluster_identifier        = "example-cluster"
  db_instance_identifier       = "instance-example"
  db_instance_class            = "db.t2.medium"
  db_engine                    = "aurora-postgresql"
  db_engine_version            = "5.6.10a"

  tags = {
    Name = "Example RDS Instance"
  }
}
