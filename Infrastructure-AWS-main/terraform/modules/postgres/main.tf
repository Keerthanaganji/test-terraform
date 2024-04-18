### Postgress ####

resource "postgres" {
  source = "../../modules/postgres"

  db_name             = var.db_name
  db_password         = var.db_password
  db_engine_version   = var.db_engine_version
  master_name         = var.master_name
  deletion_protection = var.deletion_protection
  network_type        = var.network_type
  cluster_id          = var.cluster_id
