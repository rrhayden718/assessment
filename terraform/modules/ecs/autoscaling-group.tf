resource "aws_autoscaling_group" "ecs" {
  name                 = "${format("asg-%s-ecs-%s-%s", var.customer, var.project, var.environment)}"
  launch_configuration = "${aws_launch_configuration.ecs-launch-configuration.name}"
  min_size             = "${var.min_size}"
  max_size             = "${var.max_size}"
  desired_capacity     = "${var.desired_capacity}"
  vpc_zone_identifier  = ["${split(",", var.ecs_subnets)}"]
  health_check_type    = "EC2"

  tag {
    key                 = "Name"
    value               = "${format("ec2-%s-ecs-%s-%s", var.customer, var.project, var.environment)}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Customer"
    value               = "${var.customer}"
    propagate_at_launch = true
  }

  tag {
    key                 = "startInstance"
    value               = "${var.start_time_tag}"
    propagate_at_launch = true
  }

  tag {
    key                 = "stopInstance"
    value               = "${var.stop_time_tag}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = "${var.project}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Application"
    value               = "ecs"
    propagate_at_launch = true
  }

  tag {
    key                 = "Owner"
    value               = "${var.owner}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "${var.environment}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Patch Group"
    value               = "Amazon Linux"
    propagate_at_launch = true
  }

  tag {
    key                 = "Terraform"
    value               = "1"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
