data "aws_acm_certificate" "issued" {
  domain   = "*.anuraggautam.nl"
  statuses = ["ISSUED"]
}

module "helm" {
  source      = "./modules/helmdeploy"
  ecr_repo    = "string-tmml-api"
  eks_cluster = "testeks"
  cert_arn    = data.aws_acm_certificate.issued.arn
  app_version = "IMAGE_TAG"
}