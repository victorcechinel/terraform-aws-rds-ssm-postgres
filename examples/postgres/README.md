# Example Create RDS Postgres

Execute ssh commands:
```sh
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```

## Inputs

| Name                   | Description                 | Type        | Default | Required |
| ---------------------- | --------------------------- | ----------- | ------- | -------- |
| identifier             | Database identifier         | string      | -       | yes      |
| subnet_group           | Database subnet group       | string      | -       | yes      |
| parameter_group        | Database parameter group    | string      | -       | yes      |
| vpc_security_group_ids | Database VPC security group | list string | -       | yes      |

## Settings

If you configure shared_credentials_file in the providers.tf file,
it is not necessary to configure the profile in the terraform.tf file.