#resource "aws_db_subnet_group" "example" {
#  name        = "test"
#  subnet_ids  = ["subnet-03a665b3db2978814","subnet-0731f902c06ec204c"]
#}

#resource "aws_security_group" "example" {
#  name        = "testvpckey"
#  description = "Security group for PostgreSQL"
#  vpc_id      = "vpc-07832f2f1eb8d75eb"
#}

#resource "aws_db_instance" "example" {
#  identifier           = "static-member-1"
#  engine               = "aurora-postgresql"
#  engine_version       = 15.4
#  instance_class       = "db.r5.large"
#  vpc_id               = "vpc-07832f2f1eb8d75eb"
#  db_subnet_group_name = "my-db-subnet-group"
#}

resource "aws_rds_cluster" "democluster" {
  cluster_identifier      = "demo-cluster-member-1"
  engine                  = "aurora-postgresql"
  engine_version          = "15.4"
  database_name           = "mydb"
  master_username         = "user"
  master_password         = "admin@123"
  #backup_retention_period = 5
  #preferred_backup_window = "07:00-09:00"
  vpc_security_group_ids  = "vpc-07832f2f1eb8d75eb"
  db_subnet_group_name    = "my-db-subnet-group"
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count                   = 2
  identifier              = "demo-cluster-member-instance-${count.index + 1}"
  cluster_identifier      = aws_rds_cluster.democluster.id
  instance_class          = "db.r5.large"
  engine                  = "aurora-postgresql"
  publicly_accessible     = false
  apply_immediately       = true
}

resource "aws_security_group" "clustervpc" {
  name   = "clustervpc"
  vpc_id = "vpc-07832f2f1eb8d75eb"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "clustersubnet" {
  group_name       = "clustergroup"
  subnet_ids = ["subnet-03a665b3db2978814","subnet-0731f902c06ec204c"]

  tags = {
    Name = "My database subnet group demo"
  }
}
