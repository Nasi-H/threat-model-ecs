resource "aws_vpc" "threatcomposer_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.threatcomposer_vpc.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = var.public_subnet_1_az
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-1 subnet"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.threatcomposer_vpc.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = var.public_subnet_2_az
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-2 subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.threatcomposer_vpc.id

  tags = {
    Name = "Internet gateway for VPC"
  }
}

resource "aws_route_table" "internet_access" {
  vpc_id = aws_vpc.threatcomposer_vpc.id

  route {
    cidr_block = var.public_cidr
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Route tables for internet access"
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.internet_access.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.internet_access.id
}