data "aws_route53_zone" "selected" {
  name = "${var.hosted_zone}"
}

resource "aws_route53_record" "hostname" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "${var.hostname}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_cloudfront_distribution.default.domain_name}"]
}
