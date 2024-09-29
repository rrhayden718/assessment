# Get Current Account
data "aws_caller_identity" "current" {}

# Data SNS Topics
# data "aws_sns_topic" "ops" {
#   name = ""
# }

# data "aws_sns_topic" "jira" {
#   name = ""
# }

# data "aws_sns_topic" "pagerduty" {
#   name = ""
# }

# Cluster Connections
#none
resource "aws_cloudwatch_metric_alarm" "vpnstatus_none" {
  count                     = "${var.monitor_none}"
  alarm_name                = "${format("%s-%s-VPNStatus-%s", data.aws_caller_identity.current.account_id, var.customer, aws_vpn_connection.vpn.id)}"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "25"
  metric_name               = "${aws_vpn_connection.vpn.id}"
  namespace                 = "VPNStatus"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = "0"
  alarm_description         = "This metric monitors The AWS VPN. "
  # alarm_actions             = []
  # insufficient_data_actions = []
  # ok_actions                = []

  # dimensions {
  #   CGW    = "${aws_customer_gateway.customer_gw.id}"
  #   Region = "${var.region}"
  #   VGW    = "${aws_vpn_gateway.vpn_gw.id}"
  # }
}

#Ops
resource "aws_cloudwatch_metric_alarm" "vpnstatus_ops" {
  count                     = "${var.monitor_ops}"
  alarm_name                = "${format("%s-%s-VPNStatus-%s", data.aws_caller_identity.current.account_id, var.customer, aws_vpn_connection.vpn.id)}"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "25"
  metric_name               = "${aws_vpn_connection.vpn.id}"
  namespace                 = "VPNStatus"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = "0"
  alarm_description         = "This metric monitors The AWS VPN. "
  # alarm_actions             = ["${data.aws_sns_topic.ops.arn}"]
  # insufficient_data_actions = ["${data.aws_sns_topic.ops.arn}"]
  # ok_actions                = ["${data.aws_sns_topic.ops.arn}"]

  # dimensions {
  #   CGW    = "${aws_customer_gateway.customer_gw.id}"
  #   Region = "${var.region}"
  #   VGW    = "${aws_vpn_gateway.vpn_gw.id}"
  # }
}

#Basic
resource "aws_cloudwatch_metric_alarm" "vpnstatus_basic" {
  count                     = "${var.monitor_basic}"
  alarm_name                = "${format("%s-%s-VPNStatus-%s", data.aws_caller_identity.current.account_id, var.customer, aws_vpn_connection.vpn.id)}"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "25"
  metric_name               = "${aws_vpn_connection.vpn.id}"
  namespace                 = "VPNStatus"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = "0"
  alarm_description         = "This metric monitors The AWS VPN. "
  # alarm_actions             = ["${data.aws_sns_topic.jira.arn}"]
  # insufficient_data_actions = ["${data.aws_sns_topic.ops.arn}"]
  # ok_actions                = ["${data.aws_sns_topic.ops.arn}"]

  # dimensions {
  #   CGW    = "${aws_customer_gateway.customer_gw.id}"
  #   Region = "${var.region}"
  #   VGW    = "${aws_vpn_gateway.vpn_gw.id}"
  # }
}

#Full Warn
resource "aws_cloudwatch_metric_alarm" "vpnstatus_full_warn" {
  count                     = "${var.monitor_full}"
  alarm_name                = "${format("%s-%s-WARN-VPNStatus-%s", data.aws_caller_identity.current.account_id, var.customer, aws_vpn_connection.vpn.id)}"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "25"
  metric_name               = "${aws_vpn_connection.vpn.id}"
  namespace                 = "VPNStatus"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = "0"
  alarm_description         = "This metric monitors The AWS VPN. "
  # alarm_actions             = ["${data.aws_sns_topic.jira.arn}"]
  # insufficient_data_actions = ["${data.aws_sns_topic.ops.arn}"]
  # ok_actions                = ["${data.aws_sns_topic.ops.arn}"]

  # dimensions {
  #   CGW    = "${aws_customer_gateway.customer_gw.id}"
  #   Region = "${var.region}"
  #   VGW    = "${aws_vpn_gateway.vpn_gw.id}"
  # }
}

#Full Warn
resource "aws_cloudwatch_metric_alarm" "vpnstatus_full_error" {
  count                     = "${var.monitor_full}"
  alarm_name                = "${format("%s-%s-ERROR-VPNStatus-%s", data.aws_caller_identity.current.account_id, var.customer, aws_vpn_connection.vpn.id)}"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "60"
  metric_name               = "${aws_vpn_connection.vpn.id}"
  namespace                 = "VPNStatus"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = "0"
  alarm_description         = "This metric monitors The AWS VPN."
  # alarm_actions             = ["${data.aws_sns_topic.jira.arn}", "${data.aws_sns_topic.pagerduty.arn}"]
  # insufficient_data_actions = ["${data.aws_sns_topic.ops.arn}"]
  # ok_actions                = ["${data.aws_sns_topic.ops.arn}"]

  # dimensions {
  #   CGW    = "${aws_customer_gateway.customer_gw.id}"
  #   Region = "${var.region}"
  #   VGW    = "${aws_vpn_gateway.vpn_gw.id}"
  # }
}
