output "source_bucket_id" {
  description = "Name of the source S3 bucket."
  value = aws_s3_bucket.source.id
}

output "destination_bucket_id" {
  description = "Name of the destination S3 bucket."
  value = aws_s3_bucket.destination.id
}
