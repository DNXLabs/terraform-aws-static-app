data "aws_s3_bucket" "selected" {
  bucket = var.s3_bucket_id
}
