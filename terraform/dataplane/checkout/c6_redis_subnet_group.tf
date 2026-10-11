resource "aws_elasticache_subnet_group" "checkout_redis" {
  name       = "${local.name}-checkout-redis-subnet-group"
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids

  tags = merge(var.tags, {
    Name = "${local.name}-checkout-redis-subnet-group"
  })
}