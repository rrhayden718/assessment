# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  # tags = {
  #   Name        = "${format("igw-%s-%s-%s", var.customer, var.project, var.environment)}"
  #   Customer    = "${var.customer}"
  #   Environment = "${var.environment}"
  #   Project     = "${var.project}"
  #   Owner       = "${var.owner}"
  #   Terraform   = true
  # }
}

# Create Public Subnet, Based on Count of CSV variable
resource "aws_subnet" "public" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${element(split(",", var.public_subnets), count.index)}"
  availability_zone = "${element(split(",", var.azs), count.index)}"
  count             = "${length(split(",", var.public_subnets))}"

  tags = {
    Name        = "${format("subnet-%s-public-%s-%s", var.customer, var.project, var.environment)}"
    Customer    = "${var.customer}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Owner       = "${var.owner}"
    Terraform   = true
    Tier        = "Public"
    AZ          = "${element(split(",", var.azs), count.index)}"
  }

  lifecycle {
    create_before_destroy = true
  }

  map_public_ip_on_launch = true
}

# Create Public Route Table
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name        = "${format("rtbl-%s-public-%s-%s", var.customer, var.project, var.environment)}"
    Customer    = "${var.customer}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Owner       = "${var.owner}"
    Terraform   = true
  }
}

# Public Route to Internet Gateway
resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
  depends_on             = [aws_internet_gateway.igw, aws_route_table.public]
}

# Public Route Table S3 Endpoint
resource "aws_vpc_endpoint_route_table_association" "public_s3" {
  route_table_id  = "${aws_route_table.public.id}"
  vpc_endpoint_id = "${aws_vpc_endpoint.s3.id}"
}

# Route Table Association - 1 Per Public Subnet Created
resource "aws_route_table_association" "public" {
  count          = "${length(split(",", var.public_subnets))}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}
