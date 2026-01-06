resource "aws_ecs_cluster" "threatcomposer_cluster" {
  name = var.ecs_cluster_name

  tags = {
    Name = "ECS cluster for threat composer model"
  }
}

resource "aws_ecs_service" "threatcomposer_ecs_service" {
  name                               = var.ecs_service_name
  cluster                            = aws_ecs_cluster.threatcomposer_cluster.id
  task_definition                    = aws_ecs_task_definition.service.arn
  desired_count                      = var.desired_task_count
  launch_type                        = "FARGATE"
  deployment_minimum_healthy_percent = var.deployment_min_healthy_percent
  deployment_maximum_percent         = var.deployment_max_percent


  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [var.ecs_sg_id]
    assign_public_ip = true
  }
}

resource "aws_ecs_task_definition" "service" {
  family                   = var.task_family
  requires_compatibilities = ["FARGATE"]
  network_mode             = var.network_mode
  execution_role_arn       = var.execution_role_arn
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.container_image
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
        }
      ]
      logConfiguration = {
        logDriver = var.log_driver
        options = {
          "awslogs-group"         = var.log_group_name
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = var.log_stream_prefix
        }
      }
    },
  ])

}