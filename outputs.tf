output "kms_key_id" {
  description = "ID of key used to encrypt table data."
  value = aws_kms_key.example.key_id
}
