variable "name" {
  description = "The name of the Glue job"
}

variable "connections" {
  description = "The list of connections used by the Glue job"
}

variable "description" {
  description = "The description of the Glue job"
}

variable "max_retries" {
  description = "The maximum number of times to retry the job if it fails"
}

variable "timeout" {
  description = "The job timeout in minutes"
}
variable "vpc_id" {
  description = "The ID of the VPC where the Glue job will run"
  type        = string
}
variable "subnet_ids" {
  description = "A list of existing subnet IDs where the RDS PostgreSQL cluster will be deployed"
  type        = list(string)
}

variable "security_group_ids" {
  description = "A list of existing security group IDs for the RDS PostgreSQL cluster"
  type        = list(string)
}

variable "security_configuration" {
  description = "The ID of an existing security configuration for the Glue job"
}

variable "number_of_workers" {
  description = "The number of workers to allocate for the Glue job"
}
variable "worker_type" {
  type    = string
}

variable "use_glue_catalog" {
  description = "Flag to indicate whether to use Glue Data Catalog as Hive metastore"
  type        = bool
  default     = true
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

