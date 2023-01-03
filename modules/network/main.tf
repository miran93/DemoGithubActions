
# AWS-VPC #
resource "aws_vpc" "module_vpc" {
  cidr_block = "${var.vpc_cidr_block}"
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support
  tags = merge(
    var.tags
  )
}


# AWS-SUBNET #
resource "aws_subnet" "module_subnet" {
  vpc_id     = "${aws_vpc.module_vpc.id}" 
  cidr_block = "${cidrsubnet(aws_vpc.module_vpc.cidr_block, 3, 1)}"
  availability_zone = var.availability_zone
}


# AWS-INTERNET-GATEWAY #
resource "aws_internet_gateway" "test-env-gw" {
  vpc_id = "${aws_vpc.module_vpc.id}"
tags = merge(
    var.tags
  )
}

# AWS ROUTE TABLE #
resource "aws_route_table" "route-table-test-env" {
  vpc_id = "${aws_vpc.module_vpc.id}"
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.test-env-gw.id}"
  }
tags = merge(
    var.tags
  )
}


# AWS ROUTE TABLE ASSOCIATION #
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.module_subnet.id}"
  route_table_id = "${aws_route_table.route-table-test-env.id}"
}
