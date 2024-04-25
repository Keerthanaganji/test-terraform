variable "region" {
  description = "AWS region"
}

variable "bucket_name_first" {
  type = string
  description = "Name of the first s3 Bucketb"
}  
 variable "bucket_name_log" {
  type = string
  description = "Name of the second s3 Bucketb"
}

variable "cluster_identifier" {
  description = "The identifier for the RDS cluster"
}

variable "instance_identifier" {
  description = "The identifier for the RDS instance"
}

variable "engine" {
  description = "The database engine to use (e.g., aurora, mysql)"
}

variable "engine_version" {
  description = "The version of the database engine"
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
}

variable "master_username" {
  description = "The master username for the RDS cluster"
}

variable "master_password" {
  description = "The master password for the RDS cluster"
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs for the RDS cluster"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS cluster"
  type        = list(string)
}

variable "engine_mode" {
  description = "The database engine mode. Valid values: `global`, `multimaster`, `parallelquery`, `provisioned`, `serverless`. Defaults to: `provisioned`"
  type        = string
  default     = "provisioned"
}

variable "engine_version" {
  description = "The engine version for the PostgreSQL instance"
  default     = "15.6"
  type = string
}
variable "db_subnet_group_name" {
  description = "The name of the subnet group name (existing or created)"
  type        = string
  default     = ""
}

variable "cidr_block" {
  description = "List of subnet IDs used by database subnet group created"
  type        = string
}

variable "apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is `false`"
  type        = bool
  default     = null
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for instances. Set to `0` to disable. Default is `0`"
  type        = number
  default     = 60
}
variable "id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = ""
}

variable "allocated_storage" {
  description = "The amount of storage in gibibytes (GiB) to allocate to each DB instance in the Multi-AZ DB cluster. (This setting is required to create a Multi-AZ DB cluster)"
  type        = number
  default     = null
}
variable "max_allocated_storage" {
  description = "The amount of storage in gibibytes (GiB) to allocate to each DB instance in the Multi-AZ DB cluster. (This setting is required to create a Multi-AZ DB cluster)"
  type        = number
  default     = null
}

variable "master_username" {
  description = "Username for the master DB user. Required unless `snapshot_identifier` or `replication_source_identifier` is provided or unless a `global_cluster_identifier` is provided when the cluster is the secondary cluster of a global database"
  type        = string
  default     = null
}
variable "skip_final_snapshot" {
  description = "Determines whether a final snapshot is created before the cluster is deleted. If true is specified, no snapshot is created"
  type        = bool
  default     = false
}

variable "name" {
  description = "The name of the Glue job"
}


variable "connections" {
  description = "The list of connections used by the Glue job"
}

variable "description" {
  description = "The description of the Glue job"
}

variable "glue_version" {
  description = "The Glue version to be used for the job"
}

variable "max_retries" {
  description = "The maximum number of times to retry the job if it fails"
}

variable "timeout" {
  description = "The job timeout in minutes"
}

variable "security_configuration" {
  description = "The ID of an existing security configuration for the Glue job"
}

variable "worker_type" {
  description = "The type of worker to use for the Glue job"
}

variable "number_of_workers" {
  description = "The number of workers to allocate for the Glue job"
}

variable "script_location" {
  description = "The S3 path to the script that the Glue job runs"
}


variable "python_version" {
  type        = number
  default     = 3
  description = "(Optional) The Python version being used to execute a Python shell job."

  validation {
    condition     = contains([2, 3], var.python_version)
    error_message = "Allowed values are 2 or 3."
  }
}





