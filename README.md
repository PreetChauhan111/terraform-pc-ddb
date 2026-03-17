# terraform-pc-ddb

Terraform wrapper module for [terraform-aws-modules/dynamodb-table/aws](https://registry.terraform.io/modules/terraform-aws-modules/dynamodb-table/aws/latest) (v5.5.0).

## Usage

```hcl
module "dynamodb_table" {
  source  = "./terraform-pc-ddb"

  name        = "my-table"
  hash_key    = "id"
  range_key   = "title"
  billing_mode = "PAY_PER_REQUEST"

  attributes = [
    { name = "id",    type = "N" },
    { name = "title", type = "S" }
  ]

  tags = {
    Environment = "dev"
    Project     = "my-project"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.7 |
| aws | >= 6.28 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 6.28 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| dynamodb-table | terraform-aws-modules/dynamodb-table/aws | 5.5.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | Name of the DynamoDB table | `string` | `null` | yes |
| hash_key | The attribute to use as the hash (partition) key | `string` | `null` | yes |
| attributes | List of nested attribute definitions (name, type: S/N/B) | `list(map(string))` | `[]` | yes |
| range_key | The attribute to use as the range (sort) key | `string` | `null` | no |
| billing_mode | PROVISIONED or PAY_PER_REQUEST | `string` | `"PAY_PER_REQUEST"` | no |
| read_capacity | Read units (required if billing_mode is PROVISIONED) | `number` | `null` | no |
| write_capacity | Write units (required if billing_mode is PROVISIONED) | `number` | `null` | no |
| create_table | Controls if DynamoDB table and associated resources are created | `bool` | `true` | no |
| deletion_protection_enabled | Enables deletion protection for table | `bool` | `null` | no |
| table_class | STANDARD or STANDARD_INFREQUENT_ACCESS | `string` | `null` | no |
| point_in_time_recovery_enabled | Whether to enable point-in-time recovery | `bool` | `false` | no |
| point_in_time_recovery_period_in_days | Number of preceding days for continuous backups (default 35) | `number` | `null` | no |
| ttl_enabled | Indicates whether TTL is enabled | `bool` | `false` | no |
| ttl_attribute_name | Table attribute to store the TTL timestamp | `string` | `""` | no |
| stream_enabled | Indicates whether Streams are enabled | `bool` | `false` | no |
| stream_view_type | KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, or NEW_AND_OLD_IMAGES | `string` | `null` | no |
| server_side_encryption_enabled | Enable encryption at rest using AWS managed KMS CMK | `bool` | `false` | no |
| server_side_encryption_kms_key_arn | ARN of the CMK for KMS encryption | `string` | `null` | no |
| global_secondary_indexes | GSI definitions for the table | `any` | `[]` | no |
| local_secondary_indexes | LSI definitions (allocated at creation only) | `any` | `[]` | no |
| ignore_changes_global_secondary_index | Ignore lifecycle changes to GSIs (useful for provisioned tables with scaling) | `bool` | `false` | no |
| replica_regions | Region names for global DynamoDB table replicas | `any` | `[]` | no |
| global_table_witness | Witness Region for Multi-Region Strong Consistency deployment | `object` | `null` | no |
| autoscaling_enabled | Whether to enable autoscaling | `bool` | `false` | no |
| autoscaling_defaults | Default autoscaling settings (scale_in_cooldown, scale_out_cooldown, target_value) | `map(string)` | `{scale_in_cooldown=0, scale_out_cooldown=0, target_value=70}` | no |
| autoscaling_read | Read autoscaling settings (`max_capacity` required) | `map(string)` | `{}` | no |
| autoscaling_write | Write autoscaling settings (`max_capacity` required) | `map(string)` | `{}` | no |
| autoscaling_indexes | Index autoscaling configurations | `map(map(string))` | `{}` | no |
| on_demand_throughput | Maximum read/write units for on-demand table | `any` | `{}` | no |
| warm_throughput | Number of warm read/write units for the table | `any` | `{}` | no |
| import_table | Configurations for importing S3 data into a new table | `any` | `{}` | no |
| resource_policy | JSON definition of the resource-based policy | `string` | `null` | no |
| restore_date_time | Point-in-time recovery point to restore | `string` | `null` | no |
| restore_source_name | Name of the table to restore from | `string` | `null` | no |
| restore_source_table_arn | ARN of the source table (required for cross-region restores) | `string` | `null` | no |
| restore_to_latest_time | Restore table to the most recent PITR point | `bool` | `null` | no |
| region | AWS region for this resource | `string` | `null` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| timeouts | Terraform resource management timeouts | `map(string)` | `{create="10m", update="60m", delete="10m"}` | no |

## Outputs

| Name | Description |
|------|-------------|
| dynamodb_table_arn | ARN of the DynamoDB table |
| dynamodb_table_id | ID of the DynamoDB table |
| dynamodb_table_stream_arn | ARN of the Table Stream |
| dynamodb_table_stream_label | ISO 8601 timestamp of the Table Stream |
| dynamodb_table_replicas | Map of Table replicas by region |
| dynamodb_table_replica_arns | Map of Table replica ARNs |
| dynamodb_table_replica_stream_arns | Map of Table replica stream ARNs |
| dynamodb_table_replica_stream_labels | Map of Table replica stream timestamps |
