variable "region" {
  description = "The AWS region"
  type        = string
}

variable "environment" {
  description = "The environment name"
}

variable "artifact_bucket" {
  description = "The name of the artifact bucket"
  type        = string
}

variable "log_bucket" {
  description = "The name of the log bucket"
  type        = string
}

variable "raw_bucket" {
  description = "The name of the raw bucket"
  type        = string
}

variable "processed_bucket" {
  description = "The name of the processed bucket"
  type        = string
}

variable "limfinity_bucket" {
  description = "The name of the limfinity bucket"
  type        = string
}

variable "identifier" {
  description = "The ARN for accessing the limfinity bucket"
  type     = list(string)
}
