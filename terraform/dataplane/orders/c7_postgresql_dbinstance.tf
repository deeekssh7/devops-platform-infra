resource "aws_db_instance" "orders_postgresql" {
  identifier               = "${local.name}-orders-postgresql"
  engine                   = "postgres"
  engine_version           = "16.9"
  instance_class           = "db.t3.micro"
  allocated_storage        = 20
  db_name                  = "ordersdb"
  username                 = local.retailstore_secret_json.username
  password                 = local.retailstore_secret_json.password
  db_subnet_group_name     = aws_db_subnet_group.orders_postgresql.name
  vpc_security_group_ids   = [aws_security_group.orders_postgresql_sg.id]
  skip_final_snapshot      = true
  publicly_accessible      = false
  delete_automated_backups = true
  multi_az                 = false
  backup_retention_period  = 1

  tags = merge(var.tags, {
    Name = "${local.name}-orders-postgresql"
  })
}

output "orders_postgresql_endpoint" {
  description = "PostgreSQL endpoint for Orders service"
  value       = aws_db_instance.orders_postgresql.address
}