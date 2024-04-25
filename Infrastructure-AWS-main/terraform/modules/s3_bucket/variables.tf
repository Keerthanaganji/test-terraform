variable "bucket_name_first" {
  type = string
  description = "Name of the first s3 Bucketb"
}  
 
variable "bucket_name_archieve" {
  type = string
  description = "Name of the second s3 Bucketb"
}

variable "lifecycle_transition_days_glacier" {
  description = "Number of days before transitioning to Glacier storage class"
  default     = 30
}

variable "lifecycle_transition_days_deep_archive" {
  description = "Number of days before transitioning to Deep Archive storage class"
  default     = 60
}

