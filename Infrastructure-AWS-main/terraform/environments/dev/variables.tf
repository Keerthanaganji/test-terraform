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





