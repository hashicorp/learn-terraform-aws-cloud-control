# AWS CC provider tutorial

This information is under Non-Disclosure Agreement and not for disclosure
outside HashiCorp except with AWS. At this time we ask that you do not discuss
or mention the contents with HashiCorp customers or prospects or external
parties.

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
