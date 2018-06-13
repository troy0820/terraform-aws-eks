terraform {
  required_version = "> 0.11.0"
}

provider "aws" {
  region  = "${var.region}"
  profile = "${var.profile}"
}

module "eks-remote-state" {
  source = "../../modules/remote_state"

  is_ready    = true
  s3_bucket   = "${var.s3_bucket}"
  dynamo_name = "${var.dynamo_name}"
}
