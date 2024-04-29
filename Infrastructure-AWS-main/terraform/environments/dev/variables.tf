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

variable "name" {
  description = "The name of the Glue job"
}


variable "connections" {
  description = "The list of connections used by the Glue job"
}

variable "description" {
  description = "The description of the Glue job"
}

variable "timeout" {
  description = "The job timeout in minutes"
}
variable "max_retries" {
  type        = number
  description = "The maximum number of retries for the Glue job"
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
variable "cluster_name" {
  description = "The name of the RDS PostgreSQL cluster"
}

variable "allocated_storage" {
  description = "The amount of storage (in GB) to be initially allocated for the database"
  default     = 100
}

variable "instance_class" {
  description = "The instance type to use for the RDS PostgreSQL cluster"
  default     = "db.t3.medium"
}

variable "engine" {
  description = "The database engine to use for the RDS PostgreSQL cluster"
  default     = "aurora-postgresql"
}

variable "engine_version" {
  description = "The version of the database engine to use for the RDS PostgreSQL cluster"
  default     = "10.14"
}

variable "vpc_id" {
  description = "The ID of the existing VPC where the RDS PostgreSQL cluster will be created"
}

variable "subnet_ids" {
  description = "A list of existing subnet IDs where the RDS PostgreSQL cluster will be deployed"
  type        = list(string)
}

variable "security_group_ids" {
  description = "A list of existing security group IDs for the RDS PostgreSQL cluster"
  type        = list(string)
}
variable "subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
}




