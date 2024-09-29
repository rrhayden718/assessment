variable "vpc_id" {
  type        = "string"
  description = "VPC ID - Must be passed in from network module"
}

variable "region" {
  type        = "string"
  default     = "us-east-1"
  description = "Deployment Region"
}

variable "customer" {
  type        = "string"
  default     = "SouceFuse"
  description = "Name Of The Customer"
}

variable "environment" {
  type        = "string"
  default     = "dev"
  description = "Stage"
}

variable "owner" {
  type        = "string"
  default     = "Rhayden"
  description = "Person Or Team Who is Main Point Of Contact"
}

variable "project" {
  type        = "string"
  default     = "Assessment"
  description = "Used For Project Tag"
}


variable "ecs_cluster" {
  type        = "string"
  default     = "nginx"
  description = "Concourse web Instance Type"
}

variable "enable_external_cidrs" {
  type        = "string"
  default     = false
  description = "Boolean - If True Allow External CIDRS"
}

variable "external_cidrs" {
  type        = "list"
  default     = []
  description = "Extra CIDRS that Needs Access - Most Likely Peers"
}

variable "ecs_subnets" {
  type        = "string"
  description = "CSV of Subnets to Deploy to"
}

variable "start_time_tag" {
  type        = "string"
  description = "Start Time Tag"
  default     = ""
}

variable "stop_time_tag" {
  type        = "string"
  description = "Stop Tag Time"
  default     = ""
}

variable "min_size" {
  description = "Min Instances"
  type        = "string"
  default     = 0
}

variable "max_size" {
  description = "Max Instances"
  type        = "string"
  default     = 1
}

variable "desired_capacity" {
  description = "Desired Capacity Instances"
  type        = "string"
  default     = 1
}

# variable "efs_id" {
#   type        = "string"
#   description = "efs id to mount"
# }

variable "monitor_none" {
  type        = "string"
  description = "No Alarms Are Configured"
  default     = 0
}

variable "monitor_ops" {
  type        = "string"
  description = "Alarms Only Email Dev Ops"
  default     = 0
}

variable "monitor_basic" {
  type        = "string"
  description = "Alarms Configured to Send to Jira"
  default     = 0
}

variable "monitor_full" {
  type        = "string"
  description = "Alarms for Jira and PagerDuty"
  default     = 0
}

variable "cpu_utilization_threshold" {
  type        = "string"
  description = "CPU Utilization Threshold"
  default     = 95
}

variable "memory_utilization_threshold" {
  type        = "string"
  description = "Memory Utilization Threshold"
  default     = 95
}
