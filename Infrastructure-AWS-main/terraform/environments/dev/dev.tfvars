bucket_name_first = "artifact-bucket-infratest"
bucket_name_log = "log-bucket-infratest"
region = "eu-west-1"

datahub_to_ref         = "example-glue_job"
description            = "My Glue job description"
max_retries            = 2
timeout                = 2880

  

cluster_name             = "my-postgres-cluster"
allocated_storage        = 100
instance_class           = "db.r5.large"
engine                   = "aurora-postgresql"
engine_version           = "10.14"
subnet_group_name        = "my_db_subnet_group22"
master_username              = var.master_username
master_password              = var.master_password





  

