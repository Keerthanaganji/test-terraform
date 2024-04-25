bucket_name_first = "artifact-bucket-infratest"
bucket_name_log = "log-bucket-infratest"
bucket_name_raw = "raw-bucket-infratest"
region = "eu-west-1"

name              = "glue-job"
connections            = ["connection1", "connection2"]
description            = "My Glue job description"
glue_version           = "1.0"
max_retries            = 3
timeout                = 60
security_configuration = true
worker_type            = "G.1X"
number_of_workers      = 2
python_version         = 3
script_location        = "s3://mysamplebuckettest1119/provider_aws.txt"

################################################################################
# PostgreSQL Serverless v2
################################################################################

engine            = "aurora-postgresql"
engine_mode       = "provisioned"
engine_version    = "15.6"
database_name           = "postgresqlv2"
master_username   = "rootuser"
id                = "vpc-0c62dcc69ca138dc0"
db_subnet_group_name = "test"
cidr_block       = "172.31.48.0/20"
allocated_storage      = "0.5"
max_allocated_storage      = "8"
monitoring_interval  = "60"
apply_immediately    = "true"
skip_final_snapshot  = "true"
instance_class       = "serverless"



  

