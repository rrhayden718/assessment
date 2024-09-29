variable "vpc_id" {
  type        = string
  description = "VPC ID - Must be passed in from network module - e.g. "
}

variable "region" {
  type        = string
  description = "AWS Regio We are Deploying into"
  default     = "us-east-1"
}

variable "bgp_asn" {
  type        = string
  default     = "65000"
  description = "The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN)"
}

variable "ip_address" {
  type        = string
  description = "(Required) The IP address of the gateway's Internet-routable external interface. "
}

variable "type" {
  type        = string
  default     = "ipsec.1"
  description = "The type of customer gateway. The only type AWS supports at this time is ipsec.1"
}

variable "customer" {
  type        = string
  default     = "idauto"
  description = "Name Of The Customer"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Stage"
}

variable "owner" {
  type        = string
  default     = "Support"
  description = "Person Or Team Who is Main Point Of Contact"
}

variable "project" {
  type        = string
  default     = "ri"
  description = "Used For Project Tag"
}

variable "amazon_side_asn" {
  type        = string
  default     = "64512"
  description = "A ASN for the Amazon side of a BGP session. If you're using a 16-bit ASN, it must be in the 64512 to 65534 range. If you're using a 32-bit ASN, it must be in the 4200000000 to 4294967294 range"
}

variable "static_routes_only" {
  type        = string
  default     = "true"
  description = "Whether the VPN connection uses static routes exclusively. Static routes must be used for devices that don't support BGP. "
}

variable "private_route_table_ids" {
  type        = string
  description = "CSV of Route Table IDS - This must come from network module - e.g. "
}

variable "public_route_table_ids" {
  type        = string
  default     = ""
  description = "CSV of Route Table IDS - This must come from network module - e.g."
}

variable "vpn_routes" {
  type        = list
  description = "List of CIDRS to Route Over the VPN - These are the subnets on the customers local network we want to reach"
  default     = []
}

variable "monitor_none" {
  type        = string
  description = "No Alarms Are Configured"
  default     = 0
}

variable "monitor_ops" {
  type        = string
  description = "Alarms Only Email Dev Ops"
  default     = 0
}

variable "monitor_basic" {
  type        = string
  description = "Alarms Configured to Send to Jira"
  default     = 0
}

variable "monitor_full" {
  type        = string
  description = "Alarms for Jira and PagerDuty"
  default     = 0
}

variable "customer_gw_name" {
  type        = string
  description = "Name of Customer GW - default should follow cgw-customer-env"
}

variable "vpn_gw_name" {
  type        = string
  description = "Name of Customer GW - default should follow vgw-customer-env"
}

variable "vpn_name" {
  type        = string
  description = "Name of Customer GW - default should follow vpn-customer-env"
}
