# Customer Gateway
resource "aws_customer_gateway" "customer_gw" {
  bgp_asn    = "${var.bgp_asn}"
  ip_address = "${var.ip_address}"
  type       = "${var.type}"

  tags = {
    Name        = "${var.customer_gw_name}"
    Customer    = "${var.customer}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Owner       = "${var.owner}"
    Terraform   = true
  }
}

# VPN Connection
resource "aws_vpn_connection" "vpn" {
  customer_gateway_id = "${aws_customer_gateway.customer_gw.id}"
  static_routes_only  = "${var.static_routes_only}"
  type                = "${var.type}"
  vpn_gateway_id      = "${aws_vpn_gateway.vpn_gw.id}"

  tags = {
    Name        = "${var.vpn_name}"
    Customer    = "${var.customer}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Owner       = "${var.owner}"
    Terraform   = true
  }
}

# Configure Route propagation
resource "aws_vpn_gateway_route_propagation" "private_subnets_vpn_routing" {
  count          = "${length(split(",", var.private_route_table_ids))}"
  vpn_gateway_id = "${aws_vpn_gateway.vpn_gw.id}"
  route_table_id = "${element(split(",", var.private_route_table_ids), count.index)}"
}

resource "aws_vpn_gateway_route_propagation" "public_subnets_vpn_routing" {
  count          = "${length(var.public_route_table_ids) > 0 ? length(split(",", var.public_route_table_ids)) : 0}"
  vpn_gateway_id = "${aws_vpn_gateway.vpn_gw.id}"
  route_table_id = "${element(split(",", var.private_route_table_ids), count.index)}"
}

# Configure Static Routes if static_routes_only is true
resource "aws_vpn_connection_route" "vpn" {
  count                  = "${var.static_routes_only ? length(var.vpn_routes) : 0}"
  vpn_connection_id      = "${aws_vpn_connection.vpn.id}"
  destination_cidr_block = "${element(var.vpn_routes, count.index)}"
}


#VPN Gateway
resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id          = "${var.vpc_id}"
  amazon_side_asn = "${var.amazon_side_asn}"

  tags = {
    Name        = "${var.vpn_gw_name}"
    Customer    = "${var.customer}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Owner       = "${var.owner}"
    Terraform   = true
  }
}
