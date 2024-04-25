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

variable "instance_class" {
  description = "The instance class for the RDS instance"
}

variable "db_master_username" {
  description = "The master username for the RDS cluster"
}

variable "master_password" {
  description = "The master password for the RDS cluster"
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs for the RDS cluster"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS cluster"
  type        = list(string)
}
