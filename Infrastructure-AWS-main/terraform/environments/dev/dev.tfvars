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





  

