variable "name" {}

variable "s3_bucket_id" {}

variable "hostnames" {
  type = list(string)
}

variable "hosted_zone" {}

variable "certificate_arn" {}

variable "hostname_create" {
  description = "Create hostname in the hosted zone passed?"
  default     = true
}

variable "cloudfront_logging_bucket" {
  type        = string
  default     = ""
  description = "Bucket to store logs from app"
}

variable "cloudfront_logging_prefix" {
  type        = string
  default     = ""
  description = "Logging prefix"
}

variable "cloudfront_web_acl_id" {
  default     = ""
  description = "Optional web acl (WAF) to attach to CloudFront"
}
