resource "aws_ecs_task_definition" "nginx" {
  family                   = "nginx"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "nginx",
    "image": docker.io/nginx/mainline:1.27.1",
    "cpu": 256,
    "memory": 512,
    "essential": true
    "portMappings": [
        {
            "containerPort": 80,
            "protocol": "tcp"
        }
]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}