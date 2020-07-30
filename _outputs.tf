output "cf_domain_name" {
  description = "CloudFront Domain Name"
  value       = aws_cloudfront_distribution.default.domain_name
}
