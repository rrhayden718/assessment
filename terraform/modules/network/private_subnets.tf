# Create Nat Gateway, One Per AZ
resource "aws_eip" "nat" {
  # vpc = true

  count = "${var.nat_gw_count}"
 
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"

  count = "${var.nat_gw_count}"

  tags = {
    Name        = "${format("ngw-%s-%s-%s", var.customer, var.project, var.environment)}"
    Customer    = "${var.customer}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Owner       = "${var.owner}"
    Terraform   = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Private Subnets Per Subnet in CSV
resource "aws_subnet" "private" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${element(split(",", var.private_subnets), count.index)}"
  availability_zone = "${element(split(",", var.azs), count.index)}"
  count             = "${length(split(",", var.private_subnets))}"

  tags = {
    Name        = "${format("subnet-%s-private-%s-%s", var.customer, var.project, var.environment)}"
    Customer    = "${var.customer}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Owner       = "${var.owner}"
    Terraform   = true
    Tier        = "Private"
    AZ          = "${element(split(",", var.azs), count.index)}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Private Subnet Route Tables
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.main.id}"
  count  = "${length(split(",", var.private_subnets))}"

  tags = {
    Name        = "${format("rtbl-%s-private-%s-%s", var.customer, var.project, var.environment)}"
    Customer    = "${var.customer}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Owner       = "${var.owner}"
    Terraform   = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Public Route to Internet Gateway
resource "aws_route" "private_internet_gateway" {
  count                  = "${length(split(",", var.private_subnets))}"
  route_table_id         = "${element(aws_route_table.private.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.nat.*.id, count.index)}"
  depends_on             = [aws_internet_gateway.igw, aws_route_table.private]
}

# Private Route Table S3 Endpoint
resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  count           = "${length(split(",", var.private_subnets))}"
  route_table_id  = "${element(aws_route_table.private.*.id, count.index)}"
  vpc_endpoint_id = "${aws_vpc_endpoint.s3.id}"
}

# Private Route Table Association
resource "aws_route_table_association" "private" {
  count          = "${length(split(",", var.private_subnets))}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"

  lifecycle {
    create_before_destroy = true
  }
}
