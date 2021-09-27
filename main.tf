terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    ## Add during tutorial:
    awscc = {
      source = "hashicorp/awscc"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

## Add during tutorial:
provider "awscc" {
  region = "us-west-2"
}

resource "aws_kms_key" "example" {
  description = "Example key for Cassandra table"
}

# resource "aws_s3_bucket" "source" {
#   bucket_prefix = "awscc-appflow-source-"
#   force_destroy = true
#   acl           = "private"
# }

# resource "aws_s3_bucket" "destination" {
#   bucket_prefix = "awscc-appflow-destination-"
#   force_destroy = true
#   acl           = "private"
# }

## Add during tutorial:

resource "awscc_cassandra_keyspace" "example" {
  keyspace_name = "terraform"
}

resource "awscc_cassandra_table" "example" {
  keyspace_name = awscc_cassandra_keyspace.example.keyspace_name

  partition_key_columns = [
    {
      column_name: "uid"
      column_type: "uuid"
    }
  ]
# regular_columns = [
#   {
#     column_name: "firstName"
#     column_type: "text"
#   },
#   {
#     column_name: "lastName"
#     column_type: "text"
#   },
#   {
#     column_name: "email"
#     column_type: "text"
#   }
# ]

  encryption_specification = {
    encryption_type: "AWS_OWNED_KMS_KEY"
    kms_key_identifier: aws_kms_key.example.key_id // # key ID or ARN
  }
}
