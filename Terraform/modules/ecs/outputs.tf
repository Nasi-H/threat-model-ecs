output "ecs_cluster_id" {
  value       = aws_ecs_cluster.threatcomposer_cluster.id
  description = "ID of the ECS cluster"
}

output "ecs_service_id" {
  value       = aws_ecs_service.threatcomposer_ecs_service.id
  description = "ID of the ECS service"
}
