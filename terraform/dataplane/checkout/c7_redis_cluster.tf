resource "aws_elasticache_cluster" "checkout_redis" {
  cluster_id           = "${local.name}-checkout-redis"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  engine_version       = "7.0"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.checkout_redis.name
  security_group_ids   = [aws_security_group.checkout_redis_sg.id]

  tags = merge(var.tags, {
    Name = "${local.name}-checkout-redis"
  })
}

output "checkout_redis_endpoint" {
  description = "Redis endpoint for Checkout service"
  value       = aws_elasticache_cluster.checkout_redis.cache_nodes[0].address
}

output "checkout_redis_port" {
  description = "Redis port"
  value       = aws_elasticache_cluster.checkout_redis.port
}