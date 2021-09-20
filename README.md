# AWS CC provider tutorial

For now, you must build the provider to use the tutorial. On release (Sept
30th), it will be in the registry as a normal provider. To install the provider
manually:

- Make sure Terraform and go are up to date

```
$ git clone git@github.com:hashicorp/terraform-provider-awscc.git
```

```
$ cd terraform-provider-awscc/
```

```
$ make tools
```

```
$ make all
```

(`terraform-provider-awscc` should now be in $GOPATH/bin)

You'll also need to override the provider in `~/.terraformrc` like so:

```
provider_installation {
  dev_overrides {
    "hashicorp/awscc" = "/Users/rnorwood/go/bin"
  }
  direct {}
}
```

## Prerequisites

## Clone example configuration

## Review configuration

## Create S3 buckets

## Add AWS Cloud Control provider

## Add Appflow resource

## Load data into source bucket

## Read results from destination bucket

## Clean up your infrastructure

## Next steps
