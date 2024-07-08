variable "region" {
  description = "The AWS region"
  type        = string
}

variable "vpc_id" {
  description = "The vpc_id for Endpoint Creation"
  type        = string
}

variable "service_name_endpoint" {
  description = "The service_name for Endpoint Creation"
  type        = string
}

variable "subnet_ids_endpoint" {
  description = "The subnet_ids for Endpoint Creation"
  type  = list(string)
}

variable "security_group_ids_endpoints" {
  description = "The security_group_ids for Endpoint Creation"
  type  = list(string)
}

