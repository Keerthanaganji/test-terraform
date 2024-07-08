# postgres variables
variable "region" {
  description = "The AWS region"
  type        = string
}

variable "postgres_hbs_bank_db" {
  description = "Secrets for the postgres_hbs_bank_db"
  type        = string
}

variable "postgres_description" {
  description = "The description for secrets"
  type        = string
}

variable "postgres_tags" {
  description = "A map of tags to assign to the secret"
  type        = map(string)
}

variable "postgres_username" {
  description = "The username for the secret"
  type        = string
}

variable "postgres_password" {
  description = "The password for the secret"
  type        = string
}

variable "postgres_engine" {
  description = "The postgres_engine"
  type        = string
}

variable "postgres_host" {
  description = "The postgres_host"
  type        = string
}

variable "postgres_port" {
  description = "The port for the DB"
  type        = string
}

variable "postgres_dbClusterIdentifier" {
  description = "The postgres_dbClusterIdentifier"
  type        = string
}

variable "postgres_database" {
  description = "The postgres_database"
  type        = string
}

# oracle_abba variables

variable "oracle_abba_db" {
  description = "Secrets for the oracle_abba_db"
  type        = string
}

variable "oracle_abba_description" {
  description = "The description for oracle_abba secrets"
  type        = string
}

variable "oracle_abba_tags" {
  description = "A map of tags to assign to the secret"
  type        = map(string)
}

variable "oracle_abba_username" {
  description = "The username for the secret"
  type        = string
}

variable "oracle_abba_password" {
  description = "The password for the secret"
  type        = string
}

variable "oracle_abba_engine" {
  description = "The postgres_engine"
  type        = string
}

variable "oracle_abba_host" {
  description = "The postgres_host"
  type        = string
}

variable "oracle_abba_port" {
  description = "The port for the DB"
  type        = string
}

variable "oracle_abba_database" {
  description = "The oracle_abba_database name"
  type        = string
}

# datahub Variables

variable "data_hub_db" {
  description = "The data_hub_db name"
  type        = string
}

variable "data_hub_db_description" {
  description = "The data_hub_db description"
  type        = string
}

variable "data_hub_db_tags" {
  description = "The data_hub_db_tags"
  type        = map(string)
}

variable "datahub_rsa_key" {
  description = "The datahub_rsa_key"
  type        = list(string)
}

variable "datahub_user" {
  description = "The datahub_user"
  type        = string
}

variable "datahub_account" {
  description = "The datahub_account"
  type        = string
}

variable "datahub_warehouse" {
  description = "The datahub_warehouse name"
  type        = string
}

variable "datahub_database" {
  description = "The datahub_database name"
  type        = string
}

variable "datahub_schema" {
  description = "The datahub_schema name"
  type        = string
}

variable "datahub_role" {
  description = "The datahub_role name"
  type        = string
}

#variable "datahub_passphrase" {
#  description = "The datahub_passphrase name"
#  type        = string
#}

