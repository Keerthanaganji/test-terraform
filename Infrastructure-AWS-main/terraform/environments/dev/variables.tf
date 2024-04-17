variable "region" {
  description = "AWS region"
}

variable "bucket_name" {
  type = string
  description = "Name of the first S3 Bucket"
}


variable "db_instance_identifier" {
  description = "The identifier for the PostgreSQL instance"
  default     = "example-postgres"
  type = string
}

variable "db_name" {
  description = "The name of the database to create within the PostgreSQL instance"
  default     = "exampledb"
  type = string
}

variable "db_username" {
  description = "The username for accessing the PostgreSQL database"
  default     = "postgresadmin"
  type = string
}

variable "db_password" {
  description = "The password for accessing the PostgreSQL database"
  default     = "your_password"
  type = string
}

variable "db_instance_class" {
  description = "The instance class for the PostgreSQL instance"
  default     = "db.t2.micro"
  type = string
}

variable "db_engine_version" {
  description = "The engine version for the PostgreSQL instance"
  default     = "12.5"
  type = string
}

variable "db_allocated_storage" {
  description = "The allocated storage for the PostgreSQL instance (in GB)"
  default     = 20
  type = string
}

variable "db_skip_final_snapshot" {
  description = "Whether to skip the final snapshot when deleting the PostgreSQL instance"
  default     = true
  type = string
}


