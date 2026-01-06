module "vpc" {
    source = "./modules/vpc"
    
    project_name = var.project_name
    vpc_cidr = var.vpc_cidr
    public_cidr = var.public_cidr
    public_subnet_1_cidr = var.public_subnet_1_cidr
    public_subnet_2_cidr = var.public_subnet_2_cidr
    public_subnet_1_az = var.public_subnet_1_az
    public_subnet_2_az = var.public_subnet_2_az
}

module "security" {
  source = "./modules/security_groups"

  vpc_id = module.vpc.vpc_id
  alb_sg_name = var.alb_sg_name
  ecs_sg_name = var.ecs_sg_name
  alb_allowed_ipv4_cidr = var.alb_allowed_ipv4_cidr
  alb_http_port = var.alb_http_port
  alb_https_port = var.alb_https_port
}

module "alb" {
  source = "./modules/alb"

  environment_name = var.environment_name
  vpc_id = module.vpc.vpc_id
  alb_name          = var.alb_name
  alb_http_port     = var.alb_http_port
  alb_https_port    = var.alb_https_port
  alb_sg_id         = module.security.alb_sg_id
  public_subnet_ids = module.vpc.public_subnets
  internal = var.internal
  certificate_arn   = var.certificate_arn
  ssl_policy = var.ssl_policy
  target_group_name = var.target_group_name
  container_port = var.container_port
  health_check_path = var.health_check_path
  health_check_interval = var.health_check_interval
  health_check_timeout = var.health_check_timeout
  healthy_threshold = var.healthy_threshold
  health_check_success_codes = var.health_check_success_codes
}

module "ecs" {
  source = "./modules/ecs"
  
  aws_region = var.aws_region
  network_mode = var.network_mode
  ecs_cluster_name = var.ecs_cluster_name
  ecs_service_name = var.ecs_service_name
  ecs_sg_id = module.security.ecs_sg_id
  task_family = var.task_family
  task_cpu = var.task_cpu
  task_memory = var.task_memory
  desired_task_count = var.desired_task_count
  target_group_arn = module.alb.alb_target_group_arn
  subnet_ids = module.vpc.public_subnets
  container_name = var.container_name
  container_image = var.container_image
  container_port = var.container_port
  deployment_min_healthy_percent = var.deployment_min_healthy_percent
  deployment_max_percent = var.deployment_max_percent
  log_driver = var.log_driver
  log_group_name = var.log_group_name
  log_retention_days = var.log_retention_days
  log_stream_prefix = var.log_stream_prefix
  execution_role_arn = module.iam.ecs_task_execution_role_arn
}




module "iam" {
  source = "./modules/iam"

  ecs_task_execution_role_name = var.ecs_task_execution_role_name
  attached_policy_arn = var.attached_policy_arn
}

module "route53" {
  source = "./modules/route53"

  hosted_zone_domain = var.hosted_zone_domain
  certificate_domain_name = var.certificate_domain_name
  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id = module.alb.alb_zone_id
  private_zone = var.private_zone
}

