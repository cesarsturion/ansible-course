## VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    "Name"                                      = "${var.tagName}-vpc"
  }
}

## private subnets
resource "aws_subnet" "private-subnet" {
  count             = var.az_count
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.vpc.id

  tags = {
    "Name"                                      = "${var.tagName}-private-subnet"
  }
}

## public subnets
resource "aws_subnet" "public-subnet" {
  count = var.az_count
  # var.az_count é usado para não conflitar com o private
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, var.az_count + count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "${var.tagName}-public-subnet"
  }
}

## Mgmt subnets
resource "aws_subnet" "mgmt-subnet" {
  count = var.az_count
  # var.az_count é usado para não conflitar com o private
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 2 * (var.az_count + count.index))
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.vpc.id

  tags = {
    "Name"                                      = "${var.tagName}-mgmt-subnet"
  }
}

