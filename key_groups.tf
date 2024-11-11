resource "aws_cloudfront_public_key" "default" {
  for_each    = { for public_key in var.trusted_key_groups : public_key.name => public_key }
  comment     = ""
  encoded_key = each.value.public_key_contents
  name        = each.key
}

resource "aws_cloudfront_key_group" "default" {
  for_each = { for public_key in var.trusted_key_groups : public_key.name => public_key }
  comment  = ""
  items    = [aws_cloudfront_public_key.default[each.key].id]
  name     = each.key
}
