output "cf_domain_name" {
  description = "CloudFront Domain Name"
  value       = var.module_enabled ? aws_cloudfront_distribution.default[0].domain_name : null
}

output "cloudfront_distribution_id" {
  description = "CloudFront Distribution ID"
  value       = var.module_enabled ? aws_cloudfront_distribution.default[0].id : null
}
