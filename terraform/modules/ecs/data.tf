data "aws_vpc" "vpc" {
  id = "${var.vpc_id}"
}
# Get Current Account
data "aws_caller_identity" "current" {}
