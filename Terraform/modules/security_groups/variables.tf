variable "vpc_id" {
  type        = string
  description = "VPC ID for the security groups"
}

variable "alb_sg_name" {
  type        = string
  description = "Name of the ALB security group"
}

variable "ecs_sg_name" {
  type        = string
  description = "Name of the ECS security group"
}

variable "alb_allowed_ipv4_cidr" {
  type        = string
  description = "IPv4 CIDR allowed for ALB"
}

variable "alb_http_port" {
  type        = number
  description = "HTTP port for ALB"
}

variable "alb_https_port" {
  type        = number
  description = "HTTPS port for ALB"
}
