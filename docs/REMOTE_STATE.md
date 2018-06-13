# Remote state module

This module is used to create the S3 bucket and
dynamodb table for the remote state.  The state for this
will be stored within the platform that is used to call this
module.

```bash
Usage:

module "remote-state" {
  source = "../../modules/remote_state"

  is_ready = true

  s3_bucket = "${var.s3_bucket}"
  dynamo_name = "${var.dynamo_name}"
  Tags will go here once defined in the module
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| dynamo_name | Tags for Dynamo table | string | - | yes |
| is_ready | Is the null_resource ready | string | - | yes |
| s3_bucket | Tags for Dynamo table | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| dynamo_table_arn | This is the arn for the dynamodb table for the remote state. |
| dynamo_table_id | This is the dynamodb table id for the remote state. |
| is_complete | This is the trigger from the null_resource that shows this module is complete. |
| s3_bucket_arn | This is the arn for the s3 bucket. |
| s3_bucket_id | This is the s3 bucket id for the remote state. |

