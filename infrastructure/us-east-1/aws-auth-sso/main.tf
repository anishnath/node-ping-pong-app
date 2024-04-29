resource "kubernetes_config_map" "aws_auth" {
  metadata {
    annotations = {}
    labels      = {}
    name        = "aws-auth"
    namespace   = "kube-system"
  }
  binary_data   = {}
  data          = {
    "mapRoles"  = <<-EOTROLES
      - groups:
        - system:bootstrappers
        - system:nodes
        rolearn: arn:aws:iam::1111111111:role/eks-nodegrp-role
        username: system:node:{{EC2PrivateDNSName}}
      - groups:
        - system:masters
        rolearn: arn:aws:iam::1111111111:role/AWSReservedSSO_AdministratorAccess_04b9b29f094f9388
        username: Admins:{{SessionName}}
      - groups:
        - devs
        rolearn: arn:aws:iam::1111111111:role/AWSReservedSSO_developers_52ec598d4834521e
        username: Developers:{{SessionName}}
      - groups:
        - bolt
        rolearn: arn:aws:iam::617878884475:user/eks-bolt
        username: EKS Bolt
    EOTROLES
    "mapUsers"  = <<-EOTUSERS
      - groups:
        - system:masters
        userarn: arn:aws:iam::1111111111:user/eks-orch
        username: EKS orchestrator
    EOTUSERS
  }
}