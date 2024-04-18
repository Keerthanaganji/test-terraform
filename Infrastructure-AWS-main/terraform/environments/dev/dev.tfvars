bucket_name = "mysamplebuckettest1119"
region = "eu-west-1"

full_name              = "glue-job"
create_role            = true
connections            = ["connection1", "connection2"]
description            = "My Glue job description"
glue_version           = "1.0"
max_retries            = 3
timeout                = 60
create_security_configuration = true
worker_type            = "G.1X"
number_of_workers      = 2
python_version         = 3
script_location        = "s3://mysamplebuckettest1119/provider aws.txt"

################################################################################
# PostgreSQL Serverless v2
################################################################################

engine  = "aurora-postgresql"
engine_mode       = "provisioned"
engine_version  = "14.5"
name  = "postgresqlv2"
master_username   = "root"
vpc_id               = "vpc-0c62dcc69ca138dc0"
db_subnet_group_name = "test"
private_subnets_cidr_blocks = "sg-01f9d5f3a04f634bc"



  

