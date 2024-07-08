variable "region" {
  description = "The AWS region"
  type        = string
}

variable "environment" {
  description = "The environment name"
}

variable "athena_bucket" {
  description = "The name of the athena bucket"
  type        = string
}

variable "workgroup_name" {
  description = "The name of the workgroup name"
  type        = string
}

variable "database" {
  type        = string
  description = "Name of the database"
}

variable "gluerole" {
  type        = string
  description = "Glure role ARN for Athena"
}

variable "crawlerbucketpath" {
  type        = string
  description = "Bucket path for crawler to create tables"
}

