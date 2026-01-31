resource "aws_security_group" "alb_sg" {
  name        = var.alb_sg_name
  description = "Security group for the ALB allowing inbound HTTP from the internet"
  vpc_id      = var.vpc_id

  tags = {
    Name = "ALB security group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = var.alb_allowed_ipv4_cidr
  from_port         = var.alb_http_port
  ip_protocol       = "tcp"
  to_port           = var.alb_http_port
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = var.alb_allowed_ipv4_cidr
  from_port         = var.alb_https_port 
  to_port           = var.alb_https_port
  ip_protocol       = "tcp"
}


resource "aws_vpc_security_group_egress_rule" "alb_allow_all_ipv4" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = var.alb_allowed_ipv4_cidr
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_security_group" "ecs_sg" {
  name        = var.ecs_sg_name
  description = "Security group for ECS tasks, inbound allowed from ALB only"
  vpc_id      = var.vpc_id

  tags = {
    Name = "ECS security group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_to_ecs" {
  security_group_id            = aws_security_group.ecs_sg.id
  referenced_security_group_id = aws_security_group.alb_sg.id
  from_port                    = var.container_port
  ip_protocol                  = "tcp"
  to_port                      = var.container_port
}

resource "aws_vpc_security_group_egress_rule" "ecs_allow_all_ipv4" {
  security_group_id = aws_security_group.ecs_sg.id
  cidr_ipv4         = var.alb_allowed_ipv4_cidr
  ip_protocol       = "-1" # semantically equivalent to all ports
}