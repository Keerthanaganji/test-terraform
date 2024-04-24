resource "aws_db_subnet_group" "example" {
  name        = "test"
  subnet_ids  = ["subnet-032f000315efe9124","subnet-0731f902c06ec204c"]
}

resource "aws_security_group" "example" {
  name        = "testvpckey"
  description = "Security group for PostgreSQL"
  vpc_id      = "vpc-07832f2f1eb8d75eb"
}

resource "aws_db_instance" "example" {
  identifier           = "static-member-1"
  engine               = "aurora-postgresql"
  engine_version       = 15.4
  instance_class       = "db.r5.large"
  db_subnet_group_name = aws_db_subnet_group.example.name
}
