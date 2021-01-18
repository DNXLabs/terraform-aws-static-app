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

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| certificate\_arn | n/a | `any` | n/a | yes |
| cloudfront\_forward\_headers | Headers to forward to origin from CloudFront | `list` | <pre>[<br>  "*"<br>]</pre> | no |
| cloudfront\_logging\_bucket | Bucket to store logs from app | `string` | `""` | no |
| cloudfront\_logging\_prefix | Logging prefix | `string` | `""` | no |
| cloudfront\_origin\_keepalive\_timeout | The amount of time, in seconds, that CloudFront maintains an idle connection with a custom origin server before closing the connection. Valid values are from 1 to 60 seconds. | `number` | `5` | no |
| cloudfront\_origin\_read\_timeout | The amount of time, in seconds, that CloudFront waits for a response from a custom origin. The value applies both to the time that CloudFront waits for an initial response and the time that CloudFront waits for each subsequent packet. Valid values are from 4 to 60 seconds. | `number` | `30` | no |
| cloudfront\_web\_acl\_id | Optional web acl (WAF) to attach to CloudFront | `string` | `""` | no |
| default\_cache\_behavior\_cookies\_forward | Default cache behavior cookies forward | `list` | <pre>[<br>  "all"<br>]</pre> | no |
| default\_cache\_behavior\_forward\_headers | Default cache behavior headers forward | `list` | <pre>[<br>  "Access-Control-Request-Headers",<br>  "Access-Control-Request-Method",<br>  "Origin"<br>]</pre> | no |
| default\_cache\_behavior\_forward\_query\_string | Default cache behavior forward | `bool` | `true` | no |
| default\_root\_object | Set the default file for the application | `string` | `"index.html"` | no |
| dynamic\_custom\_origin\_config | Configuration for the custom origin config to be used in dynamic block | `any` | `[]` | no |
| dynamic\_ordered\_cache\_behavior | Ordered Cache Behaviors to be used in dynamic block | `any` | `[]` | no |
| hosted\_zone | n/a | `any` | n/a | yes |
| hostname\_create | Create hostname in the hosted zone passed? | `bool` | `true` | no |
| hostnames | n/a | `list(string)` | n/a | yes |
| minimum\_protocol\_version | The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. <br>    One of SSLv3, TLSv1, TLSv1\_2016, TLSv1.1\_2016 or TLSv1.2\_2018. Default: TLSv1.2\_2018. <br>    NOTE: If you are using a custom certificate (specified with acm\_certificate\_arn or iam\_certificate\_id), <br>    and have specified sni-only in ssl\_support\_method, TLSv1 or later must be specified. <br>    If you have specified vip in ssl\_support\_method, only SSLv3 or TLSv1 can be specified. <br>    If you have specified cloudfront\_default\_certificate, TLSv1 must be specified. | `string` | `"TLSv1.2_2018"` | no |
| module\_enabled | Enable the module to create resources | `bool` | `true` | no |
| name | n/a | `any` | n/a | yes |
| restriction\_location | The ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist) | `list` | `[]` | no |
| restriction\_type | The restriction type of your CloudFront distribution geolocation restriction. Options include none, whitelist, blacklist | `string` | `"none"` | no |
| s3\_bucket\_id | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cf\_domain\_name | CloudFront Domain Name |

<!--- END_TF_DOCS --->

## Author
Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License
Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-static-app/blob/master/LICENSE) for full details.
