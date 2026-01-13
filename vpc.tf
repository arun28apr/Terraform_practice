### VPC COKE ####
resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"

tags = {
  Name = "${var.client_name}-vpc"
  Managed_by = "${var.Managed_by}"
}
}
### Internet GW ###
resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "${var.client_name}-igw"
    Managed_by = "${var.Managed_by}"
  }
}
### Public subnet 1 ###
resource "aws_subnet" "pub_sub" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${var.client_name}-pub_sub"
    Managed_by = "${var.Managed_by}"
  }
}
### Private subnet 1 ###
resource "aws_subnet" "pri_sub" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "${var.client_name}-pri_sub"
    Managed_by = "${var.Managed_by}"
  }
}
### Public RT 1 ###
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }

  tags = {
    Name = "${var.client_name}-pub_rt"
    Managed_by = "${var.Managed_by}"
  }
}
### Private RT 1 ###
resource "aws_route_table" "pri_rt" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "${var.client_name}-pri_rt"
    Managed_by = "${var.Managed_by}"
  }
}
### Public subnet association
resource "aws_route_table_association" "pub_sub_rt" {
  subnet_id      = aws_subnet.pub_sub.id
  route_table_id = aws_route_table.pub_rt.id
}
### Private subnet association
resource "aws_route_table_association" "pri_sub_rt" {
  subnet_id      = aws_subnet.pri_sub.id
  route_table_id = aws_route_table.pri_rt.id
}
### Security Group
resource "aws_security_group" "sg1" {
  name        = "sg1"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc1.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [aws_vpc.vpc1.cidr_block]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.client_name}-sg1"
    Managed_by = "${var.Managed_by}"
  }
}
### EC2-web
resource "aws_instance" "web" {
  ami = var.ubuntu_os
  instance_type = var.my_instance_type
  key_name = "Keypair"
  subnet_id = aws_subnet.pub_sub.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sg1.id]
tags = {
  Name = "Web"
  Managed_by = "${var.Managed_by}"
}
  
}
### EC2-DB
resource "aws_instance" "db" {
  ami = var.ubuntu_os
  instance_type = var.my_instance_type
  key_name = "Keypair"
  subnet_id = aws_subnet.pri_sub.id
  vpc_security_group_ids = [aws_security_group.sg1.id]
tags = {
  Name = "DB"
  Managed_by = "${var.Managed_by}"
}
  
}