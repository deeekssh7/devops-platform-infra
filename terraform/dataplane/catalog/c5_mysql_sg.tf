# Security Group for RDS MySQL
resource "aws_security_group" "rds_mysql_sg" {
  name        = "${local.name}-rds-mysql-sg"
  description = "Security Group for RDS MySQL"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description     = "Allow MySQL from EKS cluster"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [data.terraform_remote_state.eks.outputs.eks_cluster_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${local.name}-rds-mysql-sg"
  })
}