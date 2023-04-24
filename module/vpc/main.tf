##########################################################################
# Create a VPC
##########################################################################

resource "aws_vpc" "vpc" {
  cidr_block              = var.vpc-cidr
  instance_tenancy        = "default"
  enable_dns_hostnames    = true
  tags = {
    Name = "Demo VPC"
  }
}

##########################################################################
# Create Web Public Subnet
##########################################################################

resource "aws_subnet" "web-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-subnet-1-cidr
  availability_zone       = var.availability-zone-1
  map_public_ip_on_launch = true

  tags = {
    Name = "Web-1a"
  }
}

resource "aws_subnet" "web-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-subnet-2-cidr
  availability_zone       = var.availability-zone-2
  map_public_ip_on_launch = true

  tags = {
    Name = "Web-2b"
  }
}

##########################################################################
# Create Application Private Subnet
##########################################################################

resource "aws_subnet" "application-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private-subnet-1-cidr
  availability_zone       = var.availability-zone-1
  map_public_ip_on_launch = false

  tags = {
    Name = "Application-1a"
  }
}

resource "aws_subnet" "application-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private-subnet-2-cidr
  availability_zone       = var.availability-zone-2
  map_public_ip_on_launch = false

  tags = {
    Name = "Application-2b"
  }
}

##########################################################################
# Create Database Private Subnet
##########################################################################

resource "aws_subnet" "database-subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private-subnet-3-cidr
  availability_zone = var.availability-zone-1

  tags = {
    Name = "Database-1a"
  }
}

resource "aws_subnet" "database-subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private-subnet-4-cidr
  availability_zone = var.availability-zone-2

  tags = {
    Name = "Database-2b"
  }
}

##########################################################################
# Create Internet Gateway
##########################################################################

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Demo IGW"
  }
}

##########################################################################
# Create Route Table
##########################################################################

resource "aws_route_table" "web-rt" {
  vpc_id = aws_vpc.vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "WebRT"
  }
}

##########################################################################
# Create Web Subnet association with Web route table
##########################################################################

resource "aws_route_table_association" "public-rta-1" {
  subnet_id      = aws_subnet.web-subnet-1.id
  route_table_id = aws_route_table.web-rt.id
}

resource "aws_route_table_association" "public-rta-2" {
  subnet_id      = aws_subnet.web-subnet-2.id
  route_table_id = aws_route_table.web-rt.id
}

##########################################################################
# Create EIP
##########################################################################

resource "aws_eip" "eip" {
  vpc      = true
}

##########################################################################
# Create NAT Gateway
##########################################################################

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.web-subnet-1.id

  tags = {
    Name = "Demo NAT"
  }
  depends_on = [aws_internet_gateway.igw]
}