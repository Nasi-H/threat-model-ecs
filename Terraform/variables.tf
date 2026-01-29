variable "aws_region" {
  type        = string
  description = "AWS region for all resources"
}

variable "environment_name" {
  type        = string
  description = "Deployment environment name"
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
}

variable "public_cidr" {
  type        = string
  description = "CIDR block for routing internet bound traffic"
}

variable "public_subnet_1_cidr" {
  type        = string
  description = "CIDR block for public subnet 1"
}

variable "public_subnet_1_az" {
  type        = string
  description = "Availability Zone for public subnet 1"
}

variable "public_subnet_2_cidr" {
  type        = string
  description = "CIDR block for public subnet 2"
}

variable "public_subnet_2_az" {
  type        = string
  description = "Availability Zone for public subnet 2"
}

variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer"
}

variable "alb_http_port" {
  type        = number
  description = "HTTP port for ALB"
}

variable "alb_https_port" {
  type        = number
  description = "HTTPS port for ALB"
}

variable "alb_allowed_ipv4_cidr" {
  type        = string
  description = "Allowed IPv4 CIDR block for ALB"
}

variable "ssl_policy" {
  description = "SSL policy for HTTPS listener (TLS version and ciphers)"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of ACM certificate for HTTPS"
  type        = string
}

variable "container_port" {
  type        = number
  description = "Application container port"
}

variable "alb_sg_name" {
  description = "Name of the ALB security group"
  type        = string
}

variable "ecs_sg_name" {
  description = "Name of the ECS security group"
  type        = string
}


variable "target_group_name" {
  type        = string
  description = "Name of the target group"
}

variable "target_group_port" {
  type        = number
  description = "Target group application port"
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

variable "http_listener_port" {
  type        = number
  description = "HTTP listener port"
}

variable "https_listener_port" {
  type        = number
  description = "HTTPS listener port"
}

variable "ecr_repository_name" {
  type        = string
  description = "ECR repository name"
}

variable "container_image" {
  type        = string
  description = "Full container image URI"
}

variable "ecs_task_execution_role_name" {
  type        = string
  description = "Name of the ECS task execution IAM role"
}

variable "log_group_name" {
  type        = string
  description = "CloudWatch log group name"
}

variable "log_retention_days" {
  type        = number
  description = "Log retention period in days"
}

variable "log_stream_prefix" {
  type        = string
  description = "Log stream prefix for ECS logs"
}

variable "network_mode" {
  type        = string
  description = "ECS task network mode"
}

variable "log_driver" {
  type        = string
  description = "Container log driver"
}


variable "ecs_cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "task_family" {
  type        = string
  description = "ECS task definition family"
}

variable "task_cpu" {
  type        = number
  description = "CPU units for the task"
}

variable "task_memory" {
  type        = number
  description = "Memory (MiB) for the task"
}

variable "container_name" {
  type        = string
  description = "Name of the container"
}

variable "ecs_service_name" {
  type        = string
  description = "Name of the ECS service"
}

variable "desired_task_count" {
  type        = number
  description = "Desired number of running tasks"
}

variable "deployment_min_healthy_percent" {
  type        = number
  description = "Minimum healthy percent during deployment"
}

variable "deployment_max_percent" {
  type        = number
  description = "Maximum percent during deployment"
}

variable "certificate_domain_name" {
  type        = string
  description = "Domain name used to look up ACM certificate"
}

variable "hosted_zone_domain" {
  type        = string
  description = "Route 53 hosted zone domain name"
}

variable "record_subdomain" {
  type        = string
  description = "DNS record subdomain name"
}

variable "attached_policy_arn" {
  type        = string
  description = "IAM policy ARN to attach to the role"
}

variable "internal" {
  type    = bool
}

variable "private_zone" {
  type    = bool
}


