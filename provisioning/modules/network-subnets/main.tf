/**
* # Network Subnets module
*
* This module is used to create the subnets necessary for the EKS Cluster to function.  The subnets
* will be spread out between available availability zones
*
* ```bash
* Usage:
*
*  module "network-subnets" {
*    source = "../../modules/network-subnets"
*
*    is_ready                  = "${var.is_ready}"
*    subnet_count              = "${var.subnet_count}"
*    vpc_id                    = "${var.vpc_id}"
*    cidr_block                = "${var.cidr_block}"
*    vpc_cidr_block_chunk_size = "${var.vpc_cidr_block_chunk_size}"
*    vpc_start 		       = "${var.vpc_start}"
* }
*```
**/

resource "null_resource" "is_ready" {
  triggers {
    is_ready = "${var.is_ready}"
  }
}

data "aws_availability_zones" "available" {
  depends_on = ["null_resource.is_ready"]
  state      = "available"
}

resource "aws_subnet" "eks-subnet" {
  depends_on = ["null_resource.is_ready", "data.aws_availability_zones.available"]

  lifecycle {
    ignore_changes = ["*"]
  }

  count             = "${var.subnet_count}"
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${cidrsubnet(var.cidr_block, var.vpc_cidr_block_chunk_size, count.index + var.vpc_start)}"
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"

  # TODO:// Add tags to subnets 
  tags {}
}

resource "null_resource" "is_complete" {
  depends_on = ["null_resource.is_ready", "aws_subnet.eks-subnet"]
}
