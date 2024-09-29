variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Deployment Region"
}

variable "customer" {
  type        = string
  default     = "synchronet"
  description = "Name Of The Customer"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Stage"
}

variable "nat_gw_count" {
  type        = string
  default     = 2
  description = "1 or 2 NAT Gateways.  1 in dev, 2 in Prd"
}

variable "is_patching" {
  type        = string
  default     = true
  description = "true creates patch managment schedule"
}

variable "owner" {
  type        = string
  default     = "Support"
  description = "Person Or Team Who is Main Point Of Contact"
}

variable "project" {
  type        = string
  default     = "synchronet"
  description = "Used For Project Tag"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/21"
  description = "VPC CIDR"
}

variable "vpc_instance_tenancy" {
  type        = string
  default     = "default"
  description = "Instance Tenancy - Should always be default"
}

variable "vpc_dns_support" {
  type        = string
  default     = true
  description = "A boolean flag to enable/disable DNS support in the VPC."
}

variable "vpc_dns_hostname" {
  type        = string
  default     = true
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
}

variable "azs" {
  type        = string
  default     = "us-east-1a,us-east-1c"
  description = "CSV Of Valid AZs"
}

variable "private_subnets" {
  type        = string
  default     = "10.0.0.0/24,10.0.2.0/24"
  description = "The Private Subnets for Deployment. Must be within vpc_cidr"
}

variable "public_subnets" {
  type        = string
  default     = "10.0.1.0/24,10.0.3.0/24"
  description = "The Public Subnets for Deployment. Must be within vpc_cidr"
}

variable "enable_iam_user" {
  type        = string
  description = "Create IAM User"
  default     = "false"
}

variable "is_flow_log" {
  type        = string
  description = "True if sending flow logs to elasticsearch"
  default     = true
}

# Notice that all arguments are optional but you have to specify at least one argument.
# domain_name_servers, netbios_name_servers, ntp_servers are limited by AWS to maximum four servers only.
# To actually use the DHCP Options Set you need to associate it to a VPC using aws_vpc_dhcp_options_association.
# If you delete a DHCP Options Set, all VPCs using it will be associated to AWS's default DHCP Option Set.
# In most cases unless you're configuring your own DNS you'll want to set domain_name_servers to AmazonProvidedDNS.

# variable "dhcp_custom_enabled" {
#   type        = string
#   description = "1 Enabled Customer DHCP Options - 0 uses Default AWS DHCP Options"
#   default     = 0
# }

# variable "dhcp_domain_name" {
#   type        = string
#   description = "the suffix domain name to use by default when resolving non Fully Qualified Domain Names. In other words, this is what ends up being the search value in the /etc/resolv.conf file."
#   default     = ""
# }

# variable "dhcp_domain_name_servers" {
#   type        = list
#   description = "List of name servers to configure in /etc/resolv.conf. If you want to use the default AWS nameservers you should set this to AmazonProvidedDNS."
#   default     = []
# }

# variable "dhcp_ntp_servers" {
#   type        = list
#   description = "List of NTP servers to configure. "
#   default     = []
# }

# variable "dhcp_netbios_name_servers" {
#   type        = list
#   description = "List of NETBIOS name servers. "
#   default     = []
# }

# variable "dhcp_netbios_node_type" {
#   type        = string
#   description = "The NetBIOS node type (1, 2, 4, or 8). AWS recommends to specify 2 since broadcast and multicast are not supported in their network."
#   default     = ""
# }

# Patch Management Variables.
# variable "max_concurrency" {
#   description = "The maximum amount of concurrent instances of a task that will be executed in parallel"
#   type        = string
#   default     = "20"
# }

# variable "max_errors" {
#   description = "The maximum amount of errors that instances of a task will tollerate before being de-scheduled"
#   type        = string
#   default     = "50"
# }

# variable "scan_maintenance_window_schedule" {
#   description = "The schedule of the scan Maintenance Window in the form of a cron or rate expression"
#   type        = string
#   default     = "cron(0 0 18 ? * SUN *)"
# }

# variable "install_maintenance_window_schedule" {
#   description = "The schedule of the install Maintenance Window in the form of a cron or rate expression"
#   type        = string
#   default     = "cron(0 0 21 ? * SUN *)"
# }

# variable "maintenance_window_duration" {
#   description = "The duration of the maintenence windows (hours)"
#   type        = string
#   default     = "3"
# }

# variable "maintenance_window_cutoff" {
#   description = "The number of hours before the end of the Maintenance Window that Systems Manager stops scheduling new tasks for execution"
#   type        = string
#   default     = "1"
# }

# variable "approved_patches" {
#   description = "The list of approved patches for the SSM baseline"
#   type        = list
#   default     = []
# }

# variable "rejected_patches" {
#   description = "The list of rejected patches for the SSM baseline"
#   type        = list
#   default     = []
# }

# variable "product_versions" {
#   description = "The list of product versions for the SSM baseline"
#   type        = list
#   default     = ["WindowsServer2012", "WindowsServer2016", "WindowsServer2012R2", "WindowsServer2019"]
# }

# variable "patch_classification" {
#   description = "The list of patch classifications for the SSM baseline"
#   type        = list
#   default     = ["DefinitionUpdates", "CriticalUpdates", "SecurityUpdates", "ServicePacks", "FeaturePacks", "UpdateRollups", "Tools", "Updates", "Upgrades"]
# }

# variable "patch_severity" {
#   description = "The list of patch severities for the SSM baseline"
#   type        = list
#   default     = ["Critical", "Important"]
# }

# variable "approval_days" {
#   description = "Days to wait before applying patches"
#   type        = string
#   default     = "7"
# }

# variable "monitor_none" {
#   type        = string
#   description = "No Alarms Are Configured"
#   default     = 0
# }

# variable "monitor_ops" {
#   type        = string
#   description = "Alarms Only Email Dev Ops"
#   default     = 0
# }

# variable "monitor_full" {
#   type        = string
#   description = "Alarms for Jira and PagerDuty"
#   default     = 0
# }

# variable "cloudwatch_log_distribution" {
#   type        = string
#   description = "Cloudwatch Log Distribution"
#   default     = "ByLogStream"
# }
