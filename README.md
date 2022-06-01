# terraform-aws-static-app

[![Lint Status](https://github.com/DNXLabs/terraform-aws-static-app/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-static-app/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-static-app)](https://github.com/DNXLabs/terraform-aws-static-app/blob/master/LICENSE)

This is a module that creates a static application with a OAI Cloudfront.

The following resources will be created:
 - A bucket to store logs from app
 - An Amazon CloudFront origin access identity
 - Enable an optional web acl (WAF) to attach to CloudFront
 - A hostname in the hosted zone passed
 - AWS Identity and Access Management (IAM) policy for the S3 Bucket

<!--- BEGIN_TF_DOCS --->

Error: Variables not allowed: Variables may not be used here.

<!--- END_TF_DOCS --->

## Author
Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License
Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-static-app/blob/master/LICENSE) for full details.
