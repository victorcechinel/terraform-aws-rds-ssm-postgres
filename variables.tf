variable "initial_db" {
  type    = string
  default = "rds_mgm"
}

variable "identifier" {
  type = string
}

variable "username" {
  type    = string
  default = "rds_mgm"
}

variable "engine_version" {
  type    = string
  default = "12.5"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "allocated_storage" {
  type    = number
  default = 20
}

variable "storage_type" {
  type    = string
  default = "gp2"
}

variable "availability_zone" {
  type    = string
  default = "sa-east-1a"
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "subnet_group" {
  type = string
}

variable "parameter_group" {
  type = string
}

variable "backup_retention_period" {
  type    = number
  default = 3
}

variable "backup_window" {
  type    = string
  default = "03:00-05:00" # default
}

variable "maintenance_window" {
  type    = string
  default = "mon:05:00-mon:05:30" # default
}

variable "copy_tags_to_snapshot" {
  type    = bool
  default = true
}

variable "deletion_protection" {
  type    = bool
  default = true
}

variable "skip_final_snapshot" {
  type    = bool
  default = false
}

variable "auto_minor_version_upgrade" {
  type    = bool
  default = true
}

variable "multi_az" {
  type    = bool
  default = false
}

variable "apply_immediately" {
  type    = bool
  default = false
}

variable "tags" {}

variable "snapshot_identifier" {
  type    = string
  default = ""
}

variable "enabled_cloudwatch_logs_exports" {
  type    = list(string)
  default = ["postgresql", "upgrade"]
}

variable "monitoring_interval" {
  type    = number
  default = 60
}

variable "publicly_accessible" {
  type    = bool
  default = false
}

variable "performance_insights_enabled" {
  type    = bool
  default = false
}

variable "performance_insights_kms_key_id" {
  type    = string
  default = ""
}

variable "performance_insights_retention_period" {
  type    = number
  default = 0
}

variable "enabled_ssm_parameter_store" {
  type    = bool
  default = true
}

variable "max_allocated_storage" {
  type    = number
  default = 100
}
