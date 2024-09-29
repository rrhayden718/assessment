resource "aws_ecs_cluster" "nginx" {
  name = "nginx"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}