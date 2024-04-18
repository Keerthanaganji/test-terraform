resource "aws_glue_job" "this" {
  full_name                   = var.full_name
  role_arn               = var.create_role 
  connections            = var.connections
  description            = var.description
  glue_version           = var.glue_version
  max_retries            = var.max_retries
  timeout                = var.timeout
  create_security_configuration = var.create_security_configuration
  worker_type            = var.worker_type
  number_of_workers      = var.number_of_workers
}
 
