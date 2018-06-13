# Network Subnets module

This module is used to create the subnets necessary for the EKS Cluster to function.  The subnets
will be spread out between available availability zones

```bash
Usage:

 module "network-subnets" {
   source = "../../modules/network-subnets"

   is_ready                  = "${var.is_ready}"
   subnet_count              = "${var.subnet_count}"
   vpc_id                    = "${var.vpc_id}"
   cidr_block                = "${var.cidr_block}"
   vpc_cidr_block_chunk_size = "${var.vpc_cidr_block_chunk_size}"
   vpc_start                 = "${var.vpc_start}"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cidr_block | CIDR Block of the vpc to be segmented | string | - | yes |
| is_ready | Wait until it's ready | string | - | yes |
| subnet_count | How many subnets for vpc | string | - | yes |
| vpc_cidr_block_chunk_size | CIDR math for segmenting subnets | string | - | yes |
| vpc_id | ID of the VPC | string | - | yes |
| vpc_start | Where the subnets start from | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| availability_zones | The available availability_zones within the AWS region |
| is_complete | Triggers the upcoming resource that this module is done |
| public_subnets | Subnets that are going to be used for the EKS Cluster |
| subnet_cidr_blocks | The subnet cidr blocks for the EKS Cluster |

