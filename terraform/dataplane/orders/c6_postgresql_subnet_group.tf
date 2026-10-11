resource "aws_db_subnet_group" "orders_postgresql" {
  name        = "${local.name}-orders-postgresql-subnet-group"
  description = "Subnet group for Orders PostgreSQL"
  subnet_ids  = data.terraform_remote_state.vpc.outputs.private_subnet_ids

  tags = merge(var.tags, {
    Name = "${local.name}-orders-postgresql-subnet-group"
  })
}