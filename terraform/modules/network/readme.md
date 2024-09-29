## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| approval\_days | Days to wait before applying patches | string | `7` | no |
| approved\_patches | The list of approved patches for the SSM baseline | list | `<list>` | no |
| azs | CSV Of Valid AZs | string | `us-east-1a,us-east-1c` | no |
| customer | Name Of The Customer | string | `idauto` | no |
| dhcp\_custom\_enabled | 1 Enabled Customer DHCP Options - 0 uses Default AWS DHCP Options | string | `0` | no |
| dhcp\_domain\_name | the suffix domain name to use by default when resolving non Fully Qualified Domain Names. In other words, this is what ends up being the search value in the /etc/resolv.conf file. | string | `` | no |
| dhcp\_domain\_name\_servers | List of name servers to configure in /etc/resolv.conf. If you want to use the default AWS nameservers you should set this to AmazonProvidedDNS. | list | `<list>` | no |
| dhcp\_netbios\_name\_servers | List of NETBIOS name servers. | list | `<list>` | no |
| dhcp\_netbios\_node\_type | The NetBIOS node type (1, 2, 4, or 8). AWS recommends to specify 2 since broadcast and multicast are not supported in their network. | string | `` | no |
| dhcp\_ntp\_servers | List of NTP servers to configure. | list | `<list>` | no |
| elasticsearch\_arn | Elasticsearch ARN - Elasticsearch Domain must already exist | string | `arn:aws:es:us-east-1:523447765480:domain/idautocloud` | no |
| environment | Stage | string | `dev` | no |
| flow\_logs\_lambda\_arn | VPC Flow Log ARN | string | `arn:aws:lambda:us-east-1:523447765480:function:LogsToElasticsearch` | no |
| iam\_firehose\_role | IAM Role for Firehose | string | `role_firehose` | no |
| install\_maintenance\_window\_schedule | The schedule of the install Maintenance Window in the form of a cron or rate expression | string | `cron(0 0 21 ? * SUN *)` | no |
| is\_es | 1 == enabled, 0 == disabled - Is Elasticsearch Enabled in this account | string | `1` | no |
| is\_flow\_log | True if sending flow logs to elasticsearch | string | `true` | no |
| is\_patching | true creates patch managment schedule | string | `true` | no |
| kinesis\_retention\_period | Kinesis Retention Period | string | `24` | no |
| maintenance\_window\_cutoff | The number of hours before the end of the Maintenance Window that Systems Manager stops scheduling new tasks for execution | string | `1` | no |
| maintenance\_window\_duration | The duration of the maintenence windows (hours) | string | `3` | no |
| max\_concurrency | The maximum amount of concurrent instances of a task that will be executed in parallel | string | `20` | no |
| max\_errors | The maximum amount of errors that instances of a task will tollerate before being de-scheduled | string | `50` | no |
| monitor\_full | Alarms for Jira and PagerDuty | string | `0` | no |
| monitor\_none | No Alarms Are Configured | string | `0` | no |
| monitor\_ops | Alarms Only Email Dev Ops | string | `0` | no |
| nat\_gw\_count | 1 or 2 NAT Gateways.  1 in dev, 2 in Prd | string | `2` | no |
| owner | Person Or Team Who is Main Point Of Contact | string | `Support` | no |
| patch\_classification | The list of patch classifications for the SSM baseline | list | `<list>` | no |
| patch\_severity | The list of patch severities for the SSM baseline | list | `<list>` | no |
| private\_subnets | The Private Subnets for Deployment. Must be within vpc_cidr | string | `10.0.0.0/24,10.0.2.0/24` | no |
| product\_versions | The list of product versions for the SSM baseline | list | `<list>` | no |
| project | Used For Project Tag | string | `ri` | no |
| public\_subnets | The Public Subnets for Deployment. Must be within vpc_cidr | string | `10.0.1.0/24,10.0.3.0/24` | no |
| region | Deployment Region | string | `us-east-1` | no |
| rejected\_patches | The list of rejected patches for the SSM baseline | list | `<list>` | no |
| scan\_maintenance\_window\_schedule | The schedule of the scan Maintenance Window in the form of a cron or rate expression | string | `cron(0 0 18 ? * SUN *)` | no |
| shard\_count | Kinesis Stream Shard Count | string | `1` | no |
| vpc\_cidr | VPC CIDR | string | `10.0.0.0/21` | no |
| vpc\_dns\_hostname | A boolean flag to enable/disable DNS hostnames in the VPC | string | `true` | no |
| vpc\_dns\_support | A boolean flag to enable/disable DNS support in the VPC. | string | `true` | no |
| vpc\_instance\_tenancy | Instance Tenancy - Should always be default | string | `default` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_arn | S3 Bucket arn for Customer Shared Storage and Logs |
| bucket\_id | S3 Bucket ID for Customer Shared Storage and Logs |
| cloudwatch\_log\_group | Cloudwatch Log Group arn |
| igw\_id | Internet Gateway ID |
| nat\_gateway\_ids | A CSV of Nat Gateway IDs |
| private\_route\_table\_ids | CSV of Private Route Table IDs |
| private\_subnet\_ids | CSV Of Private Subnet IDs |
| public\_route\_table\_ids | CSV of Public Route Table IDs |
| public\_subnet\_ids | CSV of Public Subnet IDs |
| vpc\_azs | AZs |
| vpc\_cidr | VPC CIDR |
| vpc\_cloudwatch\_log\_group\_name | Cloudwatch Log Group Name |
| vpc\_default\_security\_group\_id | VPC Default Security Group ID |
| vpc\_enable\_dns\_hostnames | VPC DNS Hostnames |
| vpc\_enable\_dns\_support | VPC DNS Support |
| vpc\_flow\_log\_id | VPC Flow Log ID |
| vpc\_id | VPC ID |
| vpc\_instance\_tenancy | VPC Tenancy |
| vpc\_main\_route\_table\_id | VPC Main Route Table ID |
| vpc\_private\_subnet\_cidrs | Private Subnet CIDRS |
| vpc\_public\_subnet\_cidrs | Public Subnet CIDRS |
| vpc\_region | VPC Region |
| vpc\_tag\_customer | VPC Customer Tag |
| vpc\_tag\_environment | VPC Environment Tag |
| vpc\_tag\_owner | VPC Owner Tag |
| vpc\_tag\_project | VPC Project Tag |

