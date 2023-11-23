data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_ecr_repository" "service" {
  name = var.ecr_repo
}

data "aws_eks_cluster" "cluster" {
  name = var.eks_cluster
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.name]
      command     = "aws"
    }
  }
}

resource "helm_release" "this" {
  name      = "string-tmnl"
  chart     = "${path.module}/string-tmnl"
  version   = var.app_version
  namespace = "string-tmnl"
  values = [
    "${file("${path.module}/string-tmnl/values.yaml")}"
  ]
  set {
    name  = "ingress.annotations.alb\\.ingress\\.kubernetes\\.io/certificate-arn"
    value = var.cert_arn
    type  = "string"
  }
  set {
    name  = "image.repository"
    value = data.aws_ecr_repository.service.repository_url
  }

}


provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.name]
  }
}