variable "name" {}

variable "s3_bucket_id" {}

variable "hostnames" {
    type = "list"
}

variable "hosted_zone" {}

variable "certificate_arn" {}

variable "hostname_create" {
  description = "Create hostname in the hosted zone passed?"
  default     = true
}

variable "cloudfront_logging_bucket" {
  description = "Bucket to store logs from app"
}

variable "cloudfront_logging_prefix" {
  description = "Logging prefix"
}