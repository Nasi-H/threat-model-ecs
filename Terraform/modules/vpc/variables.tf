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