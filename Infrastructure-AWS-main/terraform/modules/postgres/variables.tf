variable "cluster_name" {
  description = "The name of the RDS PostgreSQL cluster"
}

variable "allocated_storage" {
  description = "The amount of storage (in GB) to be initially allocated for the database"
  default     = 100
}

variable "instance_class" {
  description = "The instance type to use for the RDS PostgreSQL cluster"
  default     = "db.t3.medium"
}

variable "engine" {
  description = "The database engine to use for the RDS PostgreSQL cluster"
  default     = "aurora-postgresql"
}

variable "engine_version" {
  description = "The version of the database engine to use for the RDS PostgreSQL cluster"
  default     = "10.14"
}

variable "vpc_id" {
  description = "The ID of the existing VPC where the RDS PostgreSQL cluster will be created"
}

variable "subnet_ids" {
  description = "A list of existing subnet IDs where the RDS PostgreSQL cluster will be deployed"
  type        = list(string)
}

variable "security_group_ids" {
  description = "A list of existing security group IDs for the RDS PostgreSQL cluster"
  type        = list(string)
}
