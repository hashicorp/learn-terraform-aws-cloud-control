output "kms_key_id" {
  description = "ID of key used to encrypt table data."
  value       = aws_kms_key.terraform.key_id
}

output "aws_region" {
  description = "AWS region for all resources."
  value       = var.aws_region
}

## Add during tutorial:
# output "keyspace_name" {
#   description = "Name of Cassandra keyspace."
#   value       = awscc_cassandra_keyspace.terraform.keyspace_name
# }
