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

variable "container_image" {
  type        = string
  description = "Full container image URI"
}

variable "container_port" {
  type        = number
  description = "Application container port"
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

variable "aws_region" {
  type        = string
  description = "AWS region for all resources"
}

variable "target_group_arn" {
  type        = string
  description = "ALB target group ARN"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for ECS service"
}

variable "ecs_sg_id" {
  type        = string
  description = "Security group ID for ECS tasks"
}

variable "execution_role_arn" {
  type        = string
  description = "IAM execution role ARN for ECS tasks"
}
