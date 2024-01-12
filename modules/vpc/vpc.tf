# VPC
resource "aws_vpc" "MainVPC" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "MainVPC"
  }
}

# 2 Subnet
data "aws_availability_zones" "availableZ" {
  state = "available" // fetch only available zones
}

resource "aws_subnet" "MainSubnet" {
  vpc_id                  = aws_vpc.MainVPC.id
  count                   = length(var.subnet_cidr)
  cidr_block              = var.subnet_cidr[count.index]
  availability_zone       = data.aws_availability_zones.availableZ.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_names[count.index] 
  }
}

#Route Table
resource "aws_route_table" "MainRouteTable" {
  vpc_id = aws_vpc.MainVPC.id
  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.MainIGW.id

  }
  tags = {
    Name = "MainRouteTable"
  }
}

# Route Table Association
resource "aws_route_table_association" "MainRouteTableAssociation" {
  count = length(var.subnet_cidr)
  route_table_id = aws_route_table.MainRouteTable.id
  subnet_id = aws_subnet.MainSubnet[count.index].id
}

# Internet Gateway
resource "aws_internet_gateway" "MainIGW" {
  vpc_id = aws_vpc.MainVPC.id

  tags = {
    Name = "MainIGW"
  }
}
output "vpc_id" {
  value = aws_vpc.MainVPC.id
}
output "subnet_id" {
  value = aws_subnet.MainSubnet[*].id
}