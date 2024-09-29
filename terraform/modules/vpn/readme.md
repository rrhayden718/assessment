## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| amazon\_side\_asn | A ASN for the Amazon side of a BGP session. If you're using a 16-bit ASN, it must be in the 64512 to 65534 range. If you're using a 32-bit ASN, it must be in the 4200000000 to 4294967294 range | string | `64512` | no |
| bgp\_asn | The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN) | string | `65000` | no |
| customer | Name Of The Customer | string | `idauto` | no |
| customer\_gw\_name | Name of Customer GW - default should follow cgw-customer-env | string | - | yes |
| environment | Stage | string | `dev` | no |
| ip\_address | (Required) The IP address of the gateway's Internet-routable external interface. | string | - | yes |
| monitor\_basic | Alarms Configured to Send to Jira | string | `0` | no |
| monitor\_full | Alarms for Jira and PagerDuty | string | `0` | no |
| monitor\_none | No Alarms Are Configured | string | `0` | no |
| monitor\_ops | Alarms Only Email Dev Ops | string | `0` | no |
| owner | Person Or Team Who is Main Point Of Contact | string | `Support` | no |
| private\_route\_table\_ids | CSV of Route Table IDS - This must come from network module - e.g. ${module.network.private_route_table_ids} | string | - | yes |
| project | Used For Project Tag | string | `ri` | no |
| region | AWS Regio We are Deploying into | string | `us-east-1` | no |
| static\_routes\_only | Whether the VPN connection uses static routes exclusively. Static routes must be used for devices that don't support BGP. | string | `true` | no |
| type | The type of customer gateway. The only type AWS supports at this time is ipsec.1 | string | `ipsec.1` | no |
| vpc\_id | VPC ID - Must be passed in from network module - e.g. ${module.network.vpc_id} | string | - | yes |
| vpn\_gw\_name | Name of Customer GW - default should follow vgw-customer-env | string | - | yes |
| vpn\_name | Name of Customer GW - default should follow vpn-customer-env | string | - | yes |
| vpn\_routes | List of CIDRS to Route Over the VPN - These are the subnets on the customers local network we want to reach | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_vpn\_connection\_cgw\_id | Customer GW Attached to VPN |
| aws\_vpn\_connection\_id | VPN ID |
| aws\_vpn\_connection\_static\_routes\_only | VPN - Static Route Boolean |
| aws\_vpn\_connection\_tags | VPN Tags |
| aws\_vpn\_connection\_vpn\_gw\_id | VPN Gateway Attached to this VPN |
| customer\_gateway\_bgp\_asn | Customer Gateway BGP ASN |
| customer\_gateway\_id | Customer Gateway ID |
| customer\_gateway\_ip\_address | Customer Gateway IP Address |
| customer\_gateway\_tags | Customer Gateway Tags |
| customer\_gateway\_type | Customer Gateway Type |
| vpn\_gateway\_id | VPN Gateway ID |

