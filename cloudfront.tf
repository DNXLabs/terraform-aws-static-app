resource "aws_cloudfront_origin_access_identity" "default" {
  comment = "${var.name}-s3"
}

resource "aws_cloudfront_distribution" "default" {
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "${var.name}"
  aliases             = "${var.hostnames}"
  price_class         = "PriceClass_All"
  default_root_object = "index.html"

  origin {
    domain_name = "${data.aws_s3_bucket.selected.bucket_regional_domain_name}"
    origin_id   = "s3Origin"

    s3_origin_config {
      origin_access_identity = "${aws_cloudfront_origin_access_identity.default.cloudfront_access_identity_path}"
    }
  }

  logging_config {
    include_cookies = false
    bucket          = "${var.cloudfront_logging_bucket}"
    prefix          = "${var.cloudfront_logging_prefix}"
  }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3Origin"
    compress         = true

    forwarded_values {
      query_string = true

      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  viewer_certificate {
    acm_certificate_arn      = "${var.certificate_arn}"
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  custom_error_response {
    error_code         = 404
    response_code      = 200
    response_page_path = "/index.html"
  }
}
