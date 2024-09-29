output "vpc_region" {
  value       = "${var.region}"
  description = "VPC Region"
}

output "vpc_tag_customer" {
  value       = "${var.customer}"
  description = "VPC Customer Tag"
}

output "vpc_tag_environment" {
  value       = "${var.environment}"
  description = "VPC Environment Tag"
}

output "vpc_tag_project" {
  value       = "${var.project}"
  description = "VPC Project Tag"
}

output "vpc_tag_owner" {
  value       = "${var.owner}"
  description = "VPC Owner Tag"
}

output "vpc_id" {
  value       = "${aws_vpc.main.id}"
  description = "VPC ID"
}

output "vpc_cidr" {
  value       = "${aws_vpc.main.cidr_block}"
  description = "VPC CIDR"
}

output "vpc_instance_tenancy" {
  value       = "${aws_vpc.main.instance_tenancy}"
  description = "VPC Tenancy"
}

output "vpc_enable_dns_support" {
  value       = "${aws_vpc.main.enable_dns_support}"
  description = "VPC DNS Support"
}

output "vpc_enable_dns_hostnames" {
  value       = "${aws_vpc.main.enable_dns_hostnames}"
  description = "VPC DNS Hostnames"
}

output "vpc_main_route_table_id" {
  value       = "${aws_vpc.main.main_route_table_id}"
  description = "VPC Main Route Table ID"
}

output "vpc_default_security_group_id" {
  value       = "${aws_default_security_group.default.id}"
  description = "VPC Default Security Group ID"
}

output "igw_id" {
  value       = "${aws_internet_gateway.igw.id}"
  description = "Internet Gateway ID"
}

output "public_subnet_ids" {
  value       = aws_subnet.public.*.id
  description = "CSV of Public Subnet IDs"
}

output "private_subnet_ids" {
  value       = aws_subnet.private.*.id
  description = "CSV Of Private Subnet IDs"
}

output "vpc_private_subnet_cidrs" {
  value       = "${var.private_subnets}"
  description = "Private Subnet CIDRS"
}

output "vpc_public_subnet_cidrs" {
  value       = "${var.public_subnets}"
  description = "Public Subnet CIDRS"
}

output "vpc_azs" {
  value       = "${var.azs}"
  description = "AZs"
}

output "nat_gateway_ids" {
  value       = "${join(",", aws_nat_gateway.nat.*.id)}"
  description = "A CSV of Nat Gateway IDs"
}

output "bucket_id" {
  value       = "${aws_s3_bucket.bucket.id}"
  description = "S3 Bucket ID for Customer Shared Storage and Logs"
}

output "bucket_arn" {
  value       = "${aws_s3_bucket.bucket.arn}"
  description = "S3 Bucket arn for Customer Shared Storage and Logs"
}

output "public_route_table_ids" {
  value       = "${join(",", aws_route_table.public.*.id)}"
  description = "CSV of Public Route Table IDs"
}

output "private_route_table_ids" {
  value       = "${join(",", aws_route_table.private.*.id)}"
  description = "CSV of Private Route Table IDs"
}

# output "cloudwatch_log_group" {
#   value       = "${aws_cloudwatch_log_group.cwl.arn}"
#   description = "Cloudwatch Log Group arn"
# }

# output "vpc_cloudwatch_log_group_name" {
#   value       = "${aws_cloudwatch_log_group.cwl.name}"
#   description = "Cloudwatch Log Group Name"
# }

# output "vpc_flow_log_id" {
#   value       = "${aws_flow_log.vpc_flow_log.id}"
#   description = "VPC Flow Log ID"
# }
