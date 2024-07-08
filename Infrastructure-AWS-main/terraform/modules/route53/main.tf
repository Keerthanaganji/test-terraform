resource "aws_route53_zone" "private" {
  name = "privatelink.snowflakecomputing.com"

  vpc {
    vpc_id = var.vpc_id
  }
}

resource "aws_route53_record" "hosturlsnowflake" {
  zone_id = aws_route53_zone.private.zone_id
  name    = var.snowflake_url
  type    = "CNAME"
  ttl     = 60
  records = var.dns_record
}

resource "aws_route53_record" "hosturloscp" {
  zone_id = aws_route53_zone.private.zone_id
  name    = var.ocsp_snowflake_url
  type    = "CNAME"
  ttl     = 60
  records = var.dns_record
}

