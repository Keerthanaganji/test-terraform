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





