resource "aws_glue_job" "datahub_to_ref" {
  name                   = var.datahub_to_ref
  role_arn               = var.role_arn
  description            = var.description
  max_retries            = var.max_retries
  timeout                = var.timeout
  max_capacity           = var.max_capacity
}

resource "aws_glue_trigger" "example_trigger" {
  name = "example-trigger"
  type = "ON_DEMAND"

  actions {
    job_name = aws_glue_job.example_job.name
    arguments = {
      "--object_key"       = "your_object_key_value"
      "--max_workers_key"  = "your_max_workers_key_value"
      "--bucket_key"       = "your_bucket_key_value"
    }
  }
}
