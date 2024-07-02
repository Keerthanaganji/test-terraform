variable "datahub_to_ref" {
  description = "The name of the Glue job"
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
