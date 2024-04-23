# modules/postgresql/variables.tf

variable "db_subnet_group_name" {
  description = "Name for the DB subnet group"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = string
}

variable "security_group_name" {
  description = "Name for the PostgreSQL security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "db_instance_identifier" {
  description = "Identifier for the DB instance"
  type        = string
}

