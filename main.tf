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

resource "aws_s3_bucket" "source" {
  bucket_prefix = "awscc-appflow-source-"
  force_destroy = true
  acl           = "private"
}

resource "aws_s3_bucket" "destination" {
  bucket_prefix = "awscc-appflow-destination-"
  force_destroy = true
  acl           = "private"
}

## Add during tutorial:
## FIXME, work in progress
resource "awscc_appflow_flow" "flow" {
  flow_name = "s3-to-s3-flow"

  source_flow_config = {
    connector_type = "S3"
    source_connector_properties = {
      s3 = {
        bucket_name   = aws_s3_bucket.source.bucket
        bucket_prefix = "foo"
      }
    }
  }
  destination_flow_config_list = [
    {
      connector_type = "S3"
      destination_connector_properties = {
        s3 = {
          bucket_name   = aws_s3_bucket.destination.bucket
          bucket_prefix = "bar"
        }
      }
    }
  ]
  tasks = [
#     {
#       task_type       = "Filter"

#       source_fields = [
#         "column_one",
#         "column_two",
#         "column_three"
#       ]
#       connector_operator = {
#         s3 = "PROJECTION"
#       }
# //      task_properties = []
#     },
    {
        source_fields = [
            "column_one"
        ]
        connector_operator = {
            s3 = "NO_OP"
        }
        destination_field = "column_one"
        task_type = "Map"
        task_properties = [{
          key = "SOURCE_DATA_TYPE"
          value = "string"
        },
        {
          key = "DESTINATION_DATA_TYPE"
          value = "string"
        }]
    }
  ]
  trigger_config = {
    trigger_type = "Scheduled"
    trigger_properties = {
      schedule_expression = "rate(1minutes)"
    }
  }
}
