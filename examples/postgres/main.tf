module "aws_rds_postgres" {
  source  = "victorcechinel/rds-ssm-postgres/aws"
  version = "1.0.6"

  identifier             = "rds-identifier"
  subnet_group           = "my-subnet-group"
  parameter_group        = "my-parameter-group"
  vpc_security_group_ids = ["vpc-security-group-ids"]

  tags = {
    Environment = "production"
  }
}
