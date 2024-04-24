provider "aws" { 
  region = "your_aws_region" 
} 

resource "aws_db_subnet_group" "example" { 
  name = "example" 
  subnet_ids = ["subnet-03a665b3db2978814","subnet-0731f902c06ec204c"] # Replace with your existing subnet IDs 
} 

resource "aws_rds_cluster" "example" { 
  cluster_identifier = "example-cluster" 
  engine = "aurora" 
  engine_mode = "serverless" 
  engine_version = "5.6.10a" 
  database_name = "example_db" 
  master_username = "admin" 
  master_password = "your_master_password" 
  db_subnet_group_name = aws_db_subnet_group.example.name 
  vpc_security_group_ids = ["sg-030c0f8e77df31572"] # Replace with your existing security group ID 
  deletion_protection = false 
  scaling_configuration { 
    auto_pause = true 
    max_capacity = 4 
    min_capacity = 2 
    seconds_until_auto_pause = 300 
  } 
} 

resource "aws_rds_cluster_instance" "example" { 
  cluster_identifier = aws_rds_cluster.example.id 
  instance_class = "db.r5.large" 
  engine = "aurora" }
