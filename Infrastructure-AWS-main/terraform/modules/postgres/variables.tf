variable "environment" {
  description = "The environment name"
}

variable "cluster_id" {
  description = "The identifier for the DB cluster"
}

variable "region" {
  description = "The AWS region"
}

variable "engine" {
  description = "The Cluster Engine"
}

variable "engine_mode" {
  description = "The Cluster engine_mode"
}

variable "engine_version" {
  description = "The Cluster engine_version"
}

variable "database_name" {
  description = "The Cluster database_name"
}

variable "master_username" {
  description = "The Cluster master_username"
}

variable "db_subnet_group_name" {
  description = "The Cluster db_subnet_group_name"
}

variable "vpc_security_group_ids" {
  description = "The Cluster vpc_security_group_ids"
  type = list(string)
}

variable "enabled_cloudwatch_logs_exports" {
  description = "The Cluster enabled_cloudwatch_logs_exports"
  type = list(string)
}

variable "db_parameter_group_name" {
  description = "The Cluster db_parameter_group_name"
}

variable "postgresql_subnet_group_ids" {
  description = "The postgresql_subnet_group_ids"
  type = list(string)
}
