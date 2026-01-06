output "route53_record_fqdn" {
  value       = aws_route53_record.subdomain_alb.fqdn
  description = "Fully qualified domain name of the ALB subdomain"
}
