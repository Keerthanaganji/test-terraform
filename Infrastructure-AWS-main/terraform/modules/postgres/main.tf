resource "aws_rds_cluster" "postgres" { 
  db_subnet_group_name           = "my-db-subnet-group"
  vpc_id                         = "vpc-07832f2f1eb8d75eb"
  db_subnet_group_subnet_ids     = ["subnet-03a665b3db2978814","subnet-0731f902c06ec204c"]
  allocated_storage              = 20
  engine                         = "postgres"
  engine_version                 = "12.4"
  instance_class                 = "db.t3.medium"
  name                           = "my-postgresql"
  username                       = "postgres"
  password                       = "your_password"
  publicly_accessible            = false
  skip_final_snapshot            = true
}
