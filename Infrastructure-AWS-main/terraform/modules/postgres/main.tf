resource "aws_db_subnet_group" "example" {
  name        = "test"
  subnet_ids  = subnet-0c6df1696416a3fb4
}

resource "aws_security_group" "example" {
  name        = testvpckey
  description = "Security group for PostgreSQL"
  vpc_id      = vpc-0c62dcc69ca138dc0
}

resource "aws_db_instance" "example" {
  identifier           = "static-member-1"
  engine               = "aurora-postgresql"
  engine_version       = 15.4
  instance_class       = "db.r5.2xlarge"
  db_subnet_group_name = aws_db_subnet_group.example.name
}
