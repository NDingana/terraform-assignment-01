resource "aws_db_instance" "myRDS" {
  name                = var.db_instance-name
  identifier          = var.db_indentifier
  instance_class      = var.db_class
  engine              = var.db_engine
  engine_version      = var.db_engVersion
  username            = var.db_username
  password            = var.db_password
  port                = var.db_port
  allocated_storage   = var.db_storage
  skip_final_snapshot = var.db_skip-snap
}