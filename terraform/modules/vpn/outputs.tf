output "customer_gateway_id" {
  value       = "${aws_customer_gateway.customer_gw.id}"
  description = "Customer Gateway ID"
}

output "customer_gateway_bgp_asn" {
  value       = "${aws_customer_gateway.customer_gw.bgp_asn}"
  description = "Customer Gateway BGP ASN"
}

output "customer_gateway_ip_address" {
  value       = "${aws_customer_gateway.customer_gw.ip_address}"
  description = "Customer Gateway IP Address"
}

output "customer_gateway_type" {
  value       = "${aws_customer_gateway.customer_gw.type}"
  description = "Customer Gateway Type"
}

output "customer_gateway_tags" {
  value       = "${aws_customer_gateway.customer_gw.tags}"
  description = "Customer Gateway Tags"
}

output "vpn_gateway_id" {
  value       = "${aws_vpn_gateway.vpn_gw.id}"
  description = "VPN Gateway ID"
}

output "aws_vpn_connection_id" {
  value       = "${aws_vpn_connection.vpn.id}"
  description = "VPN ID"
}

output "aws_vpn_connection_cgw_id" {
  value       = "${aws_vpn_connection.vpn.customer_gateway_id}"
  description = "Customer GW Attached to VPN"
}

output "aws_vpn_connection_static_routes_only" {
  value       = "${aws_vpn_connection.vpn.static_routes_only}"
  description = "VPN - Static Route Boolean"
}

output "aws_vpn_connection_tags" {
  value       = "${aws_vpn_connection.vpn.tags}"
  description = "VPN Tags"
}

output "aws_vpn_connection_vpn_gw_id" {
  value       = "${aws_vpn_connection.vpn.vpn_gateway_id }"
  description = "VPN Gateway Attached to this VPN"
}
