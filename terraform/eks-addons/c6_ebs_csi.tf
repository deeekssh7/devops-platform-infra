# ------------------------------------------------------------------------------
# IAM Role for EBS CSI Driver
# ------------------------------------------------------------------------------
resource "aws_iam_role" "ebs_csi_iam_role" {
  name               = "${local.name}-ebs-csi-iam-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(var.tags, {
    Name      = "${local.name}-ebs-csi-iam-role"
    Component = "Amazon EBS CSI Driver"
  })
}

# ------------------------------------------------------------------------------
# Attach AWS Managed Policy
# ------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "ebs_csi_managed_policy_attach" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.ebs_csi_iam_role.name
}

# ------------------------------------------------------------------------------
# Pod Identity Association for EBS CSI
# ------------------------------------------------------------------------------
resource "aws_eks_pod_identity_association" "ebs_csi" {
  cluster_name    = local.eks_cluster_name
  namespace       = "kube-system"
  service_account = "ebs-csi-controller-sa"
  role_arn        = aws_iam_role.ebs_csi_iam_role.arn
}

# ------------------------------------------------------------------------------
# Get Latest EBS CSI Addon Version
# ------------------------------------------------------------------------------
data "aws_eks_addon_version" "ebs_csi_latest" {
  addon_name         = "aws-ebs-csi-driver"
  kubernetes_version = data.terraform_remote_state.eks.outputs.eks_cluster_version
  most_recent        = true
}

# ------------------------------------------------------------------------------
# Install EBS CSI Driver Addon
# ------------------------------------------------------------------------------
resource "aws_eks_addon" "ebs_csi" {
  cluster_name             = local.eks_cluster_name
  addon_name               = "aws-ebs-csi-driver"
  addon_version            = data.aws_eks_addon_version.ebs_csi_latest.version
  service_account_role_arn = aws_iam_role.ebs_csi_iam_role.arn

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [
    aws_iam_role.ebs_csi_iam_role,
    aws_eks_pod_identity_association.ebs_csi,
    aws_eks_addon.podidentity
  ]

  tags = merge(var.tags, {
    Name      = "${local.name}-ebs-csi-addon"
    Component = "Amazon EBS CSI Driver"
  })
}