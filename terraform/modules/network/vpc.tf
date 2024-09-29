# Define VPC

resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr}"
  instance_tenancy     = "${var.vpc_instance_tenancy}"
  # enable_dns_support   = "${var.vpc_dns_support}"
  # enable_dns_hostnames = "${var.vpc_dns_hostname}"

  tags = {
    Name        = "${format("vpc-%s-%s-%s", var.customer, var.project, var.environment)}"
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

# # Configure Optional DHCP
# resource "aws_vpc_dhcp_options" "dhcp" {
#   count                = "${var.dhcp_custom_enabled}"
#   domain_name          = "${var.dhcp_domain_name}"
#   domain_name_servers  = "${var.dhcp_domain_name_servers}"
#   ntp_servers          = "${var.dhcp_ntp_servers}"
#   netbios_name_servers = "${var.dhcp_netbios_name_servers}"
#   netbios_node_type    = "${var.dhcp_netbios_node_type}"

#   tags = {
#     Name        = "${format("dhcp-%s-%s-%s", var.customer, var.project, var.environment)}"
#     Customer    = "${var.customer}"
#     Environment = "${var.environment}"
#     Project     = "${var.project}"
#     Owner       = "${var.owner}"
#     Terraform   = true
#   }
# }

# # Assigned Optional DHCP Custom Configuration
# resource "aws_vpc_dhcp_options_association" "dhcp" {
#   count           = "${var.dhcp_custom_enabled}"
#   vpc_id          = "${aws_vpc.main.id}"
#   dhcp_options_id = "${aws_vpc_dhcp_options.dhcp.id}"
# }

data "aws_region" "current" {
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = "${aws_vpc.main.id}"
  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"
  tags = {
    Name        = "${format("vpce-gw-%s-%s-%s", var.customer, var.project, var.environment)}"
    Customer    = "${var.customer}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Owner       = "${var.owner}"
    Terraform   = true
  }
}

# Block Ingress/Egress on Default Sec Group.  Since we do not use it, anything in it is wrong.
resource "aws_default_security_group" "default" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name        = "${format("secgrp-%s-default-%s-%s", var.customer, var.project, var.environment)}"
    Customer    = "${var.customer}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Owner       = "${var.owner}"
    Terraform   = true
  }
}
