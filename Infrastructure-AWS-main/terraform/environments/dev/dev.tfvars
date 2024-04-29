bucket_name_first = "artifact-bucket-infratest"
bucket_name_log = "log-bucket-infratest"
region = "eu-west-1"

name              = "glue-job"
connections            = ["connection1", "connection2"]
description            = "My Glue job description"
glue_version           = "1.0"
max_retries            = 2
timeout                = 2880
security_configuration = true
worker_type            = "G.1X"
number_of_workers      = 5
python_version         = 3
script_location        = "s3://mysamplebuckettest1119/provider_aws.py"

cluster_name             = "my-postgres-cluster"
allocated_storage        = 100
instance_class           = "db.r5.large"
engine                   = "aurora-postgresql"
engine_version           = "10.14"
vpc_id                   = "vpc-07832f2f1eb8d75eb"   # Provide your existing VPC ID here
subnet_ids               = ["subnet-03a665b3db2978814", "subnet-0731f902c06ec204c"]  # Provide your existing subnet IDs here
security_group_ids       = ["sg-030c0f8e77df31572", "sg-028f561ebcf411e7a"]
subnet_group_name        = "my_db_subnet_group22"
master_username              = var.master_username
master_password              = var.master_password





  

