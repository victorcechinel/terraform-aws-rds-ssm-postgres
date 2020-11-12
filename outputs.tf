output "rds_postgres_endpoint" {
  value = aws_db_instance.rds_postgres.endpoint
}

output "rds_postgres_username" {
  value = aws_db_instance.rds_postgres.username
}

output "rds_postgres_password" {
  value = aws_db_instance.rds_postgres.password
}
