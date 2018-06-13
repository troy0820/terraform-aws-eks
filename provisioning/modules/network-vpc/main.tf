/**
* # VPC Module
*
* This module is to create a VPC in AWS
* where your EKS cluster will live
*```bash 
* Usage:
*
* module "cluster-vpc" {
*   source = "../../modules/network-vpc"
*   is_ready   = "${var.is_ready}" 
*   cidr_block = "${var.cidr_block}"
*   ....
* }
*```
*/

resource "null_resource" "is_ready" {
  triggers {
    is_ready = "${var.is_ready}"
  }
}

resource "aws_vpc" "eks-vpc" {
  depends_on = ["null_resource.is_ready"]

  cidr_block           = "${var.cidr_block}"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  #TODO:// Add tags for VPC
  tags {}
}

resource "null_resource" "is_complete" {
  depends_on = ["null_resource.is_ready", "aws_vpc.eks-vpc"]
}
