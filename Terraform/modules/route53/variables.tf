variable "hosted_zone_domain" {
  type        = string
  description = "The domain name of the Route 53 hosted zone"
}

variable "certificate_domain_name" {
  type        = string
  description = "The subdomain to create the A record for"
}

variable "alb_dns_name" {
  type        = string
  description = "DNS name of the ALB for alias record"
}

variable "alb_zone_id" {
  type        = string
  description = "Hosted zone ID of the ALB for alias record"
}

variable "private_zone" {
  type    = bool
}

