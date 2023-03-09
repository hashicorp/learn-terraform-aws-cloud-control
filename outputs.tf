# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "kms_key_id" {
  description = "ID of the KMS key used to encrypt table data."
  value       = aws_kms_key.terraform.key_id
}

output "aws_region" {
  description = "AWS region for all resources."
  value       = var.aws_region
}
