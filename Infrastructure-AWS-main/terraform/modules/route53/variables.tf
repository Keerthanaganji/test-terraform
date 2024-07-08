
variable "region" {
  description = "The AWS region"
  type        = string
}

variable "vpc_id" {
  description = "The vpc_id for Route53 Record Creation"
  type        = string
}

variable "snowflake_url" {
  description = "The snowflake_url for Route53 Record Creation"
  type        = string
}

variable "ocsp_snowflake_url" {
  description = "The ocsp_snowflake_url for Route53 Record Creation"
  type        = string
}

variable "dns_record" {
  description = "The dns_record for Route53 Record Creation"
  type  = list(string)
}

