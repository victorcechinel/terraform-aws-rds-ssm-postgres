# AWS RDS Postgres SSM

![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.12.0-blue.svg) [![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Terraform Module to provision an AWS instance RDS Postgres and store credentials on Parameter Store.

## Features

This Terraform module creates the following AWS resources:

* **RDS**: instace Postgres RDS.
* **Parameter Store**
  * identifier: save database identifier.
  * endpoint: save database endpoint.
  * username: save database superuser.
  * passsword: save database superuser password (random generated).

## Requirements

* This module is meant for use with [Terraform](https://www.terraform.io/downloads.html) 0.12+. It has not been tested with previous versions of Terraform.
* An AWS account and your credentials (`aws_access_key_id` and `aws_secret_access_key`) configured. There are several ways to do this (environment variables, shared credentials file, etc.): my preference is to store them in a [credential file](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html). More information in the [AWS Provider](https://www.terraform.io/docs/providers/aws/index.html) documentation.

## Usage

```HCL
provider "aws" {
  version                 = "~> 2.0"
  region                  = "sa-east-1"
  shared_credentials_file = "~/.aws/credentials"
}

module "aws_rds_postgres" {
  source = "victorcechinel/terraform-aws-rds-ssm-postgres"

  identifier             = "rds-identifier"
  subnet_group           = "my-subnet-group"
  parameter_group        = "my-parameter-group"
  vpc_security_group_ids = ["vpc-group-id"]
}
```

Although AWS services are available in many locations, some of them require the `sa-east-1` (Sao Paulo) region to be configured:

* To use in other zones, change the variable `availability_zone`.


## Inputs

| Name                   | Description                 | Type        | Default | Required |
|------------------------|-----------------------------|:-----------:|:-:      |:--------:|
| identifier             | Database identifier         | string      | -       | yes      |
| subnet_group           | Database subnet group       | string      | -       | yes      |
| parameter_group        | Database parameter group    | string      | -       | yes      |
| vpc_security_group_ids | Database VPC security group | list string | -       | yes      |

## Outputs

| Name                  | Description                 |
|-----------------------|-----------------------------|
| rds_postgres_endpoint | Database endpoint           |
| rds_postgres_username | Database superuser          |
| rds_postgres_password | Database superuser password |

## Author

Module written by [@victorcechinel](https://github.com/victorcechinel). 
[Linkedin](https://www.linkedin.com/in/victorcechinelr/). 
Module Support: [terraform-aws-rds-ssm-postgres](https://github.com/victorcechinel/terraform-aws-rds-ssm-postgres). 
Contributions and comments are welcomed.

## Todo

* Save parameter store secure;
* Lambda to connect database and create data;