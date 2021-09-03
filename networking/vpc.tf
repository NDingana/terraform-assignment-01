resource "aws_vpc" "prod-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.vpc_dns-support   #gives you an internal domain name
  enable_dns_hostnames = var.vpc_dns-hostnames #gives you an internal host name
  enable_classiclink   = var.vpc_classiclink
  instance_tenancy     = var.vpc_tenancy
  tags                 = var.vpc_tags
}

resource "aws_subnet" "prod-subnet-public-1" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = var.pubsub_cidr
  map_public_ip_on_launch = var.sub_map-public //it makes this a public subnet
  availability_zone       = var.az[0]
  tags                    = var.pubsub_tags
}

resource "aws_subnet" "prod-subnet-private-1" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = var.privsub_cidr
  map_public_ip_on_launch = var.sub_map-public_no //it makes this a private subnet
  availability_zone       = var.az[1]
  tags                    = var.pubsub_tags
}

resource "aws_route_table" "prod-public-crt" {
  vpc_id = aws_vpc.prod-vpc.id
  route {
    //associated subnet can reach everywhere
    cidr_block = var.sg_cidr
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.prod-igw.id
  }
  tags = var.pubRT_tags
}

resource "aws_route_table_association" "prod-crta-public-subnet-1" {
  subnet_id      = aws_subnet.prod-subnet-public-1.id
  route_table_id = aws_route_table.prod-public-crt.id
}

resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id
  tags   = var.igw_tags
}

