### VPC COKE ####
resource "aws_vpc" "vpc_1" {
  cidr_block = "10.0.0.0/16"
tags = {
  Name = "${var.client_name}-vpc"
  Managed_by = "${var.Managed_by}"
}
}
### Internet GW ###
resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc_1.id

  tags = {
    Name = "${var.client_name}-igw"
    Managed_by = "${var.Managed_by}"
  }
}
### Public subnet 1 ###
resource "aws_subnet" "pub_sub01" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${var.client_name}-pub_sub-01"
    Managed_by = "${var.Managed_by}"
  }
}
### Private subnet 1 ###
resource "aws_subnet" "pri_sub01" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "${var.client_name}-pri_sub_01"
    Managed_by = "${var.Managed_by}"
  }
}
### Public RT 1 ###
resource "aws_route_table" "pub_rt01" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }

  tags = {
     Name = "${var.client_name}-pub_rt_01"
     Managed_by = "${var.Managed_by}"
  }
}
### Private RT 1 ###
resource "aws_route_table" "pri_rt01" {
  vpc_id = aws_vpc.vpc_1.id

  tags = {
     Name = "${var.client_name}-pri_rt_01"
     Managed_by = "${var.Managed_by}"
  }
}
### Public subnet association
### Private subnet association
### Security Group
### EC2-web
### EC2-DB