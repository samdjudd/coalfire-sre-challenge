resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.1.0.0/24"
  availability_zone       = element(var.availability_zones, 0)
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = element(var.availability_zones, 1)
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "wp_subnet_1" {
  vpc_id              = var.vpc_id
  cidr_block          = "10.1.3.0/24"
  availability_zone   = element(var.availability_zones, 0)

  tags = {
    Name = "wp-subnet-1"
  }
}

resource "aws_subnet" "wp_subnet_2" {
  vpc_id              = var.vpc_id
  cidr_block          = "10.1.2.0/24"
  availability_zone   = element(var.availability_zones, 1)

  tags = {
    Name = "wp-subnet-2"
  }
}
