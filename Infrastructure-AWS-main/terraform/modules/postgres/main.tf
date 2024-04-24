#resource "aws_db_subnet_group" "example" {
#  name        = "test"
#  subnet_ids  = ["subnet-03a665b3db2978814","subnet-0731f902c06ec204c"]
#}

#resource "aws_security_group" "example" {
#  name        = "testvpckey"
#  description = "Security group for PostgreSQL"
#  vpc_id      = "vpc-07832f2f1eb8d75eb"
#}

resource "aws_db_instance" "example" {
  identifier           = "static-member-1"
  engine               = "aurora-postgresql"
  engine_version       = 15.4
  instance_class       = "db.r5.large"
  vpc_id               = "vpc-07832f2f1eb8d75eb"
  db_subnet_group_name = "my-db-subnet-group"
}
