provider "aws" {
  region = "sa-east-1"
}

resource "random_password" "random_password_postgres" {
  length  = 20
  special = false
}

resource "aws_db_instance" "rds_postgres" {
  identifier = var.identifier
  name       = var.initial_db

  username = var.username
  password = random_password.random_password_postgres.result
  port     = 5432

  engine            = "postgres"
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type

  max_allocated_storage = var.max_allocated_storage

  availability_zone   = var.availability_zone
  publicly_accessible = var.publicly_accessible

  security_group_names   = []
  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = var.subnet_group

  parameter_group_name = var.parameter_group
  multi_az             = var.multi_az

  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window
  skip_final_snapshot     = var.skip_final_snapshot
  copy_tags_to_snapshot   = var.copy_tags_to_snapshot
  deletion_protection     = var.deletion_protection

  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  apply_immediately = var.apply_immediately

  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_kms_key_id
  performance_insights_retention_period = var.performance_insights_retention_period

  lifecycle {
    ignore_changes = [password]
  }

  tags = var.tags

  snapshot_identifier = var.snapshot_identifier

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  monitoring_interval             = var.monitoring_interval
}

resource "aws_ssm_parameter" "default_postgres_ssm_parameter_identifier" {
  count = var.enabled_ssm_parameter_store ? 1 : 0

  name  = "/rds/db/${var.identifier}/identifier"
  value = var.identifier
  type  = "String"

  overwrite = true
}

resource "aws_ssm_parameter" "default_postgres_ssm_parameter_endpoint" {
  count = var.enabled_ssm_parameter_store ? 1 : 0

  name  = "/rds/db/${var.identifier}/endpoint"
  value = aws_db_instance.rds_postgres.endpoint
  type  = "String"

  overwrite = true
}

resource "aws_ssm_parameter" "default_postgres_ssm_parameter_username" {
  count = var.enabled_ssm_parameter_store ? 1 : 0

  name  = "/rds/db/${var.identifier}/superuser/username"
  value = var.username
  type  = "String"

  overwrite = true
}

resource "aws_ssm_parameter" "default_postgres_ssm_parameter_password" {
  count = var.enabled_ssm_parameter_store ? 1 : 0

  name  = "/rds/db/${var.identifier}/superuser/password"
  value = aws_db_instance.rds_postgres.password
  type  = "String"

  overwrite = true
}
