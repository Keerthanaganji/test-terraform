provider "aws" {
  region = var.region
}

resource "aws_secretsmanager_secret" "postgres_hbs_bank_db" {
  name = var.postgres_hbs_bank_db
  description = var.postgres_description
  tags        = var.postgres_tags
}

resource "aws_secretsmanager_secret_version" "postgres_hbs_bank_db_version" {
  secret_id     = aws_secretsmanager_secret.postgres_hbs_bank_db.id
  secret_string = jsonencode({
    username = var.postgres_username,
    password = var.postgres_password,
    engine = var.postgres_engine,
    host  = var.postgres_host,
    port     = var.postgres_port,
    dbClusterIdentifier = var.postgres_dbClusterIdentifier,
    database  = var.postgres_database    
  })
}

resource "aws_secretsmanager_secret" "oracle_abba_db" {
  name = var.oracle_abba_db
  description = var.oracle_abba_description
  tags        = var.oracle_abba_tags
}

resource "aws_secretsmanager_secret_version" "oracle_abba_db_version" {
  secret_id     = aws_secretsmanager_secret.oracle_abba_db.id
  secret_string = jsonencode({
    username = var.oracle_abba_username,
    password = var.oracle_abba_password,
    engine = var.oracle_abba_engine,
    host  = var.oracle_abba_host,
    port     = var.oracle_abba_port,
    dbname  = var.oracle_abba_database    
  })
}

resource "aws_secretsmanager_secret" "data_hub_db" {
  name = var.data_hub_db
  description = var.data_hub_db_description
  tags        = var.data_hub_db_tags
}

resource "aws_secretsmanager_secret_version" "data_hub_db_version" {
  secret_id     = aws_secretsmanager_secret.data_hub_db.id
  secret_string = jsonencode({
    datahub_rsa_key = var.datahub_rsa_key,
    datahub_user = var.datahub_user,
    datahub_account = var.datahub_account,
    datahub_warehouse  = var.datahub_warehouse,
    datahub_database     = var.datahub_database,
    datahub_schema  = var.datahub_schema,
    datahub_role = var.datahub_role
#    datahub_passphrase = var.datahub_passphrase
  })
}

