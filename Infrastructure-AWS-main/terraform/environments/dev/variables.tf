variable "region" {
  description = "AWS region"
}

variable "bucket_name" {
  type = string
  description = "Name of the first S3 Bucket"
}


variable "db_name" {
  description = "The name of the database to create within the PostgreSQL instance"
  default     = "exampledb"
  type = string
}
variable "engine" {
  description = "The name of the database engine to be used for this DB cluster. Defaults to `aurora`. Valid Values: `aurora`, `aurora-mysql`, `aurora-postgresql`"
  type        = string
  default     = null
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

variable "private_subnets_cidr_blocks" {
  description = "List of subnet IDs used by database subnet group created"
  type        = list(string)
  default     = []
}

variable "apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is `false`"
  type        = bool
  default     = null
}
variable "instance_class" {
  description = "Instance type to use at master instance. Note: if `autoscaling_enabled` is `true`, this will be the same instance class used on instances created by autoscaling"
  type        = string
  default     = ""
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for instances. Set to `0` to disable. Default is `0`"
  type        = number
  default     = 0
}


variable "name" {
  description = "The name of the Glue job"
}

variable "create_role" {
  description = "Whether to create a new IAM role for the Glue job"
  default     = false
}

variable "role_arn" {
  description = "The ARN of an existing IAM role for the Glue job"
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





