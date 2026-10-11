# ------------------------------------------------------------------------------
# Download LBC IAM Policy from GitHub
# ------------------------------------------------------------------------------
data "http" "lbc_iam_policy" {
  url = "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json"
  request_headers = {
    Accept = "application/json"
  }
}

# ------------------------------------------------------------------------------
# Create LBC IAM Policy
# ------------------------------------------------------------------------------
resource "aws_iam_policy" "lbc_iam_policy" {
  name        = "${local.name}-AWSLoadBalancerControllerIAMPolicy"
  description = "AWS Load Balancer Controller IAM Policy"
  policy      = data.http.lbc_iam_policy.response_body
}

# ------------------------------------------------------------------------------
# IAM Role for LBC
# ------------------------------------------------------------------------------
resource "aws_iam_role" "lbc_iam_role" {
  name               = "${local.name}-lbc-iam-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(var.tags, {
    Name      = "${local.name}-lbc-iam-role"
    Component = "AWS Load Balancer Controller"
  })
}

# ------------------------------------------------------------------------------
# Attach Policy to Role
# ------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "lbc_iam_role_policy_attach" {
  policy_arn = aws_iam_policy.lbc_iam_policy.arn
  role       = aws_iam_role.lbc_iam_role.name
}

# ------------------------------------------------------------------------------
# Pod Identity Association for LBC
# ------------------------------------------------------------------------------
resource "aws_eks_pod_identity_association" "lbc" {
  cluster_name    = local.eks_cluster_name
  namespace       = "kube-system"
  service_account = "aws-load-balancer-controller"
  role_arn        = aws_iam_role.lbc_iam_role.arn
}

# ------------------------------------------------------------------------------
# Install LBC via Helm
# ------------------------------------------------------------------------------
resource "helm_release" "loadbalancer_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"

  wait            = true
  timeout         = 600
  cleanup_on_fail = true

  set = [
    {
      name  = "serviceAccount.create"
      value = "true"
    },
    {
      name  = "serviceAccount.name"
      value = "aws-load-balancer-controller"
    },
    {
      name  = "clusterName"
      value = local.eks_cluster_name
    },
    {
      name  = "vpcId"
      value = local.vpc_id
    },
    {
      name  = "region"
      value = var.region
    }
  ]

  depends_on = [
    aws_iam_role.lbc_iam_role,
    aws_eks_pod_identity_association.lbc,
    aws_eks_addon.podidentity
  ]
}