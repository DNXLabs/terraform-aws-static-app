resource "aws_s3_bucket" "app_frontend" {
  bucket_prefix = "my-frontend-app-"
  acl           = "private"
}

module "app_frontend" {
  source = "git::https://github.com/DNXLabs/terraform-aws-static-app.git?ref=2.0.0" # Always check the latest version

  name            = "my-frontend-app"
  s3_bucket_id    = aws_s3_bucket.app_frontend.id
  hostnames       = ["test.dnx.solutions"]
  certificate_arn = data.aws_acm_certificate.domain_host_us.arn
  hosted_zone     = "dnx.solutions"
  hostname_create = true
}
