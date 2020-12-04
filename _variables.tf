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

variable "minimum_protocol_version" {
  description = <<EOF
    The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. 
    One of SSLv3, TLSv1, TLSv1_2016, TLSv1.1_2016 or TLSv1.2_2018. Default: TLSv1.2_2018. 
    NOTE: If you are using a custom certificate (specified with acm_certificate_arn or iam_certificate_id), 
    and have specified sni-only in ssl_support_method, TLSv1 or later must be specified. 
    If you have specified vip in ssl_support_method, only SSLv3 or TLSv1 can be specified. 
    If you have specified cloudfront_default_certificate, TLSv1 must be specified.
    EOF

  type    = string
  default = "TLSv1.2_2018"
}