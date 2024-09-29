resource "aws_cloudwatch_metric_alarm" "cpu_utilization_high_none" {
  count                     = "${var.monitor_none}"
  alarm_name                = "${format("%s-%s-ECS-CPUUtilization-%s", data.aws_caller_identity.current.account_id, var.customer, aws_ecs_cluster.test-ecs-cluster.name)}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "4"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/ECS"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "${var.cpu_utilization_threshold}"
  alarm_description         = "This metric monitors ECS Cluster CPU utilization"
  alarm_actions             = []
  insufficient_data_actions = []
  ok_actions                = []

  # dimensions {
  #   ClusterName = "${aws_ecs_cluster.test-ecs-cluster.name}"
  # }
}

resource "aws_cloudwatch_metric_alarm" "memory_utilization_high_none" {
  count                     = "${var.monitor_none}"
  alarm_name                = "${format("%s-%s-ECS-MemoryUtilization-%s", data.aws_caller_identity.current.account_id, var.customer, aws_ecs_cluster.test-ecs-cluster.name)}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "4"
  metric_name               = "MemoryUtilization"
  namespace                 = "AWS/ECS"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "${var.memory_utilization_threshold}"
  alarm_description         = "This metric monitors ECS Memory utilization"
  alarm_actions             = []
  insufficient_data_actions = []
  ok_actions                = []

  # dimensions {
  #   ClusterName = "${aws_ecs_cluster.test-ecs-cluster.name}"
  # }
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_high_ops" {
  count                     = "${var.monitor_ops}"
  alarm_name                = "${format("%s-%s-ECS-CPUUtilization-%s", data.aws_caller_identity.current.account_id, var.customer, aws_ecs_cluster.test-ecs-cluster.name)}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "4"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/ECS"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "${var.cpu_utilization_threshold}"
  alarm_description         = "This metric monitors ECS Cluster CPU utilization"
  alarm_actions             = []
  insufficient_data_actions = []
  ok_actions                = []

  # dimensions {
  #   ClusterName = "${aws_ecs_cluster.test-ecs-cluster.name}"
  # }
}

resource "aws_cloudwatch_metric_alarm" "memory_utilization_high_ops" {
  count                     = "${var.monitor_ops}"
  alarm_name                = "${format("%s-%s-ECS-MemoryUtilization-%s", data.aws_caller_identity.current.account_id, var.customer, aws_ecs_cluster.test-ecs-cluster.name)}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "4"
  metric_name               = "MemoryUtilization"
  namespace                 = "AWS/ECS"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "${var.memory_utilization_threshold}"
  alarm_description         = "This metric monitors ECS Memory utilization"
  alarm_actions             = []
  insufficient_data_actions = []
  ok_actions                = []

  # dimensions {
  #   ClusterName = "${aws_ecs_cluster.test-ecs-cluster.name}"
  # }
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_high_error" {
  count                     = "${var.monitor_full}"
  alarm_name                = "${format("%s-%s-ECS-CPUUtilization-%s", data.aws_caller_identity.current.account_id, var.customer, aws_ecs_cluster.test-ecs-cluster.name)}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "4"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/ECS"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "${var.cpu_utilization_threshold}"
  alarm_description         = "This metric monitors ECS Cluster CPU utilization"
  alarm_actions             = []
  insufficient_data_actions = []
  ok_actions                = []

  # dimensions {
  #   ClusterName = "${aws_ecs_cluster.test-ecs-cluster.name}"
  # }
}

resource "aws_cloudwatch_metric_alarm" "memory_utilization_high_error" {
  count                     = "${var.monitor_full}"
  alarm_name                = "${format("%s-%s-ECS-MemoryUtilization-%s", data.aws_caller_identity.current.account_id, var.customer, aws_ecs_cluster.test-ecs-cluster.name)}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "4"
  metric_name               = "MemoryUtilization"
  namespace                 = "AWS/ECS"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "${var.memory_utilization_threshold}"
  alarm_description         = "This metric monitors ECS Memory utilization"
  alarm_actions             = []
  insufficient_data_actions = []
  ok_actions                = []

  # dimensions {
  #   ClusterName = "${aws_ecs_cluster.test-ecs-cluster.name}"
  # }
}
