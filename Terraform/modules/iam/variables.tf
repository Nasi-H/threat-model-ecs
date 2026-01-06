variable "ecs_task_execution_role_name" {
  type        = string
  description = "Name of the ECS task execution role"
}

variable "attached_policy_arn" {
  type        = string
  description = "IAM policy ARN to attach to the role"
}