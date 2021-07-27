variable "initial_db" {
  type        = string
  default     = "rds_mgm"
  description = "Initial database."
}

variable "identifier" {
  type        = string
  description = "RDS identifier."
}

variable "username" {
  type        = string
  default     = "rds_mgm"
  description = "RDS master username."
}

variable "engine_version" {
  type        = string
  default     = "12.5"
  description = "RDS engine version."
}

variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "RDS instance class."
}

variable "allocated_storage" {
  type        = number
  default     = 20
  description = "RDS storage."
}

variable "storage_type" {
  type        = string
  default     = "gp2"
  description = "RDS storage type."
}

variable "availability_zone" {
  type        = string
  default     = "sa-east-1a"
  description = "RDS az."
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "RDS security groups ids."
}

variable "subnet_group" {
  type        = string
  description = "RDS subnet group."
}

variable "parameter_group" {
  type        = string
  description = "RDS parameter group."
}

variable "backup_retention_period" {
  type        = number
  default     = 3
  description = "RDS retention backup period."
}

variable "backup_window" {
  type        = string
  default     = "03:00-05:00"
  description = "RDS backup window."
}

variable "maintenance_window" {
  type        = string
  default     = "mon:05:00-mon:05:30"
  description = "RDS maintence window."
}

variable "copy_tags_to_snapshot" {
  type        = bool
  default     = true
  description = "Copy tags to snapshot."
}

variable "deletion_protection" {
  type        = bool
  default     = true
  description = "RDS block delete protection."
}

variable "skip_final_snapshot" {
  type        = bool
  default     = false
  description = "RDS skip final snapshot."
}

variable "auto_minor_version_upgrade" {
  type        = bool
  default     = true
  description = "RDS auto minor version update."
}

variable "multi_az" {
  type        = bool
  default     = false
  description = "Multi az deployment."
}

variable "apply_immediately" {
  type        = bool
  default     = false
  description = "Apply changes immediately."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Resource tags."
}

variable "snapshot_identifier" {
  type        = string
  default     = ""
  description = "Snapshot id."
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  default     = ["postgresql", "upgrade"]
  description = "RDS cloud watch logs exports."
}

variable "monitoring_interval" {
  type        = number
  default     = 60
  description = "Monitoring interval."
}

variable "publicly_accessible" {
  type        = bool
  default     = false
  description = "RDS publicly accessible."
}

variable "performance_insights_enabled" {
  type        = bool
  default     = false
  description = "Enable RDS performance insights."
}

variable "performance_insights_kms_key_id" {
  type        = string
  default     = ""
  description = "RDS KMS key."
}

variable "performance_insights_retention_period" {
  type        = number
  default     = 0
  description = "RDS performance insights retention."
}

variable "enabled_ssm_parameter_store" {
  type        = bool
  default     = true
  description = "Save RDS credentials to SSM Parameter Store."
}

variable "max_allocated_storage" {
  type        = number
  default     = 100
  description = "RDS max allocated storage autoscailing."
}
