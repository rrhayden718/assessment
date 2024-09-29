resource "aws_security_group" "ecs" {
  name        = "${format("secgrp-%s-ecs-%s-%s-%s", var.customer, var.project, var.environment, var.ecs_cluster)}"
  description = "ECS Security Group"
  vpc_id      = "${data.aws_vpc.vpc.id}"

  lifecycle {
    create_before_destroy = true
  }

  # tags {
  #   Name        = "${format("secgrp-%s-ecs-%s-%s", var.customer, var.project, var.environment)}"
  #   Customer    = "${var.customer}"
  #   Environment = "${var.environment}"
  #   Project     = "${var.project}"
  #   Owner       = "${var.owner}"
  #   Terraform   = true
  # }
}

resource "aws_security_group_rule" "ecs_allow_local_in" {
  type        = "ingress"
  from_port   = 0
  to_port     = 0
  protocol    = -1
  cidr_blocks = ["${data.aws_vpc.vpc.cidr_block}"]

  security_group_id = "${aws_security_group.ecs.id}"
}

resource "aws_security_group_rule" "ecs_allow_all_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = -1
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.ecs.id}"
}

resource "aws_security_group_rule" "ecs_allow_extra_in" {
  count       = "${var.enable_external_cidrs}"
  type        = "ingress"
  from_port   = 0
  to_port     = 0
  protocol    = -1
  cidr_blocks = ["${var.external_cidrs}"]

  security_group_id = "${aws_security_group.ecs.id}"
}
