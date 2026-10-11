# DB Subnet Group
resource "aws_db_subnet_group" "rds_private" {
  name        = "${local.name}-rds-private-subnet-group"
  description = "RDS Subnet Group"
  subnet_ids  = data.terraform_remote_state.vpc.outputs.private_subnet_ids

  tags = merge(var.tags, {
    Name = "${local.name}-rds-private-subnet-group"
  })
}