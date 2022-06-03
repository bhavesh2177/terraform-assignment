
# Create VPC
resource "aws_vpc" "demo" {
  cidr_block 		= "${var.vpc_cidr}"

  tags = {
    Name = "${var.vpc_name}"
  }
}


# Create Private Subnet
resource "aws_subnet" "private" {
  count 		= "${length(var.private_subnets)}"
  vpc_id 		= "${aws_vpc.demo.id}"
  cidr_block 		= "${var.private_subnets[count.index]}"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "${var.private_subnet_names[count.index]}"
  }
}

# Create Public Subnet
resource "aws_subnet" "public" {
  count 		= "${length(var.public_subnets)}"
  vpc_id 		= "${aws_vpc.demo.id}"
  cidr_block 		= "${var.public_subnets[count.index]}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${var.public_subnet_names[count.index]}"
  }
}


# Create Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id		= "${aws_vpc.demo.id}"

  tags = {
    Name = "${var.internet_gw_name}"
  }
}


# Create Elasitc IP for NAT gateway
resource "aws_eip" "eip" {
  vpc			= "true"

  tags = {
    Name = "${var.eip_name}"
  }
}


# Create Nat Gateway
resource "aws_nat_gateway" "private" {
  subnet_id		= "${aws_subnet.public[0].id}"
  allocation_id		= "${aws_eip.eip.id}"

  tags = {
    Name = "${var.nat_gw_name}"
  }
}


# Creat Public Route Table
resource "aws_route_table" "public" {
  vpc_id 		= "${aws_vpc.demo.id}"
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id 	= "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "${var.public_rt_name}"
  }
}


# Creat Private Route Table
resource "aws_route_table" "private" {
  vpc_id 		= "${aws_vpc.demo.id}"
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id 	= "${aws_nat_gateway.private.id}"
  }

  tags = {
    Name = "${var.private_rt_name}"
  }
}


# Associate Route Table to Public Subnet
resource "aws_route_table_association" "public" {
  count			= "${length(var.public_subnets)}"
  subnet_id 		= "${aws_subnet.public[count.index].id}"
  route_table_id 	= "${aws_route_table.public.id}"
}


# Associate Route Table to Private Subnet
resource "aws_route_table_association" "private" {
  count			= "${length(var.private_subnets)}"
  subnet_id 		= "${aws_subnet.private[count.index].id}"
  route_table_id 	= "${aws_route_table.private.id}"
}


