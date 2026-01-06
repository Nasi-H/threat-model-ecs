variable "vpc_id" {
  type        = string
  description = "ID for vpc"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs to attach the ALB to"
}

variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer"
}

variable "alb_sg_id" {
  type        = string
  description = "Security group ID for ALB"
}

variable "alb_http_port" {
  type        = number
  description = "HTTP port for ALB"
}

variable "alb_https_port" {
  type        = number
  description = "HTTPS port for ALB"
}

variable "ssl_policy" {
  description = "SSL policy for HTTPS listener (TLS version and ciphers)"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of ACM certificate for HTTPS"
  type        = string
}

variable "environment_name" {
  type        = string
  description = "Deployment environment name"
}

variable "target_group_name" {
  type        = string
  description = "Name of the target group"
}

variable "health_check_path" {
  type        = string
  description = "Health check path"
}

variable "health_check_interval" {
  type        = number
  description = "Health check interval in seconds"
}

variable "health_check_timeout" {
  type        = number
  description = "Health check timeout in seconds"
}

variable "healthy_threshold" {
  type        = number
  description = "Number of consecutive successful health checks"
}

variable "health_check_success_codes" {
  type        = string
  description = "HTTP success codes for health check"
}

variable "container_port" {
  type        = number
  description = "Application container port"
}

variable "internal" {
  type    = bool
}
