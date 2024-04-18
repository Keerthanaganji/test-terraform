variable "full_name" {
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

variable "create_security_configuration" {
  description = "The ID of an existing security configuration for the Glue job"
}

variable "worker_type" {
  description = "The type of worker to use for the Glue job"
}

variable "number_of_workers" {
  description = "The number of workers to allocate for the Glue job"
}

