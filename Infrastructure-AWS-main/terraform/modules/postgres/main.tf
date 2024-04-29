resource "aws_vpc" "demovpc"{

  name                 = "demovpc"
  cidr                 = "10.0.0.0/16"
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}
resource "aws_db_subnet_group" "demosubnet" {
  name       = "demosubnet"
  subnet_ids = module.postgres.public_subnets

}
resource "aws_security_group" "rds" {
  name        = "demotest_rds"
  vpc_id      = module.postgres.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_db_instance" "demotest" {
  identifier             = "demotest"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgresql"
  engine_version         = "15.1"
  username               = "edu"
  password               = "admin"
  db_subnet_group_name   = aws_db_subnet_group.demotest.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.demotest.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}
