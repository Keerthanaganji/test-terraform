bucket_name = "mysamplebuckettest1119"
region = "eu-west-1"

db_name = "hbs_bank_devdb"
db_engine_version = "15.4"
master_username = "hbs_dev_admin1"
db_password = "keerthana-test"
deletion_protection = "Disabled"
network_type  = "IPv4"
cluster_id  = "dbcluster-dev-test"

full_name                   = "my-glue-job"
create_role            = true
connections            = ["connection1", "connection2"]
description            = "My Glue job description"
glue_version           = "1.0"
max_retries            = 3
timeout                = 60
create_security_configuration = true
worker_type            = "G.1X"
number_of_workers      = 2


  

