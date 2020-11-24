output "elastigroup_id" {
  description = "The ID of the Elastigroup"
  value       = element(concat(spotinst_elastigroup_aws.this.*.id, [""]), 0)
}
