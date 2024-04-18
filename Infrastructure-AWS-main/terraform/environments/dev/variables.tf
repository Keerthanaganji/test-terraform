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

variable "db_password" {
  description = "The password for accessing the PostgreSQL database"
  default     = "your_password"
  type = string
}

variable "db_engine_version" {
  description = "The engine version for the PostgreSQL instance"
  default     = "12.5"
  type = string
}

variable "deletion_protection" {
  description = "The engine version for the PostgreSQL instance"
  type = string
}
variable "network_type" {
  description = "The engine version for the PostgreSQL instance"
  type = string
}
variable "cluster_id" {
  description = "The engine version for the PostgreSQL instance"
  type = string
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





