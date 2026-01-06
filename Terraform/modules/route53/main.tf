resource "aws_route53_record" "subdomain_alb" {
  name    = var.certificate_domain_name
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  type    = "A"

  alias {

    name                   = var.alb_dns_name 
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }

}

data "aws_route53_zone" "hosted_zone" {
  name         = var.hosted_zone_domain
  private_zone = var.private_zone
}