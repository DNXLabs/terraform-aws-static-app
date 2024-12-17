output "cf_domain_name" {
  description = "CloudFront Domain Name"
  value       = var.module_enabled ? aws_cloudfront_distribution.default[0].domain_name : null
}

output "cloudfront_distribution_id" {
  description = "CloudFront Distribution ID"
  value       = var.module_enabled ? aws_cloudfront_distribution.default[0].id : null
}

output "cloudfront_key_group_id" {
  description = "CloudFront Key Group ID"
  value = {
    for k, keygroup in aws_cloudfront_key_group.default : k => keygroup.id
  }
}
output "cloudfront_public_key_id" {
  description = "CloudFront Key Group ID"
  value = {
    for k, publickey in aws_cloudfront_public_key.default : k => publickey.id
  }
}
