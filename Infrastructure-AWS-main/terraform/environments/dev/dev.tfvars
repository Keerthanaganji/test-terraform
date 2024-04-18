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
engine_version  = "15.6"
db_name  = "postgresqlv2"
master_username   = "rootuser"
id               = "vpc-0c62dcc69ca138dc0"
db_subnet_group_name = "test"
cidr_blocks = "172.31.48.0/20"



  

