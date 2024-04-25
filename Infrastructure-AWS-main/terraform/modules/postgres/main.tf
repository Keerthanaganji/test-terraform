resource "aws_rds_cluster" "example_cluster" {
  cluster_identifier        =  "example-cluster"
  database_name             = "example_db"
  engine                    = "aurora"
  engine_version            = "5.6.10a" 
  master_username           = "rrot"
  master_password           = "admin"
  skip_final_snapshot       = true

  vpc_security_group_ids    = "vpc-07832f2f1eb8d75eb"
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
  cluster_identifier        = "example-cluster"
  identifier       = "instance-example"
  instance_class            = "db.t2.medium"
  engine                    = "aurora"
  engine_version            = "5.6.10a"

  tags = {
    Name = "Example RDS Instance"
  }
}
