resource "aws_db_subnet_group" "example" {
  name        = "test"
  subnet_ids  = ["subnet-0c6df1696416a3fb4" , "subnet-09ad768b4a3d24896"]
}

resource "aws_security_group" "example" {
  name        = "testvpckey"
  description = "Security group for PostgreSQL"
  vpc_id      = "vpc-0995668dd73017681"
}

resource "aws_db_instance" "example" {
  identifier           = "static-member-1"
  engine               = "aurora-postgresql"
  engine_version       = 15.4
  instance_class       = "db.r5.large"
  db_subnet_group_name = aws_db_subnet_group.example.name
}
