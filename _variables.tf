variable "name" {}
variable "s3_bucket_id" {}
variable "hostname" {}
variable "hosted_zone" {}
variable "certificate_arn" {}

variable "hostname_create" {
  description = "Create hostname in the hosted zone passed?"
  default     = true
}
