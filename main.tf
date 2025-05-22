/**
 * # AWS EKS GitHub Actions Runner Controller Terraform module
 *
 * A Terraform module to deploy the [GitHub Actions Runner Controller]https://github.com/actions/actions-runner-controller) on Amazon EKS cluster.
 *
 * [![Terraform validate](https://github.com/lablabs/terraform-aws-eks-github-actions-runner-controller/actions/workflows/validate.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-github-actions-runner-controller/actions/workflows/validate.yaml)
 * [![pre-commit](https://github.com/lablabs/terraform-aws-eks-github-actions-runner-controller/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-github-actions-runner-controller/actions/workflows/pre-commit.yaml)
 */
locals {
  addon = {
    name = "actions-runner-controller"

    helm_chart_name    = "actions-runner-controller"
    helm_chart_version = "0.22.0"
    helm_repo_url      = "https://actions-runner-controller.github.io/actions-runner-controller"
  }

  addon_irsa = {
    (local.addon.name) = {}
  }

  addon_values = yamlencode({
    serviceAccount = {
      create = module.addon-irsa[local.addon.name].service_account_create
      name   = module.addon-irsa[local.addon.name].service_account_name
      annotations = module.addon-irsa[local.addon.name].irsa_role_enabled ? {
        "eks.amazonaws.com/role-arn" = module.addon-irsa[local.addon.name].iam_role_attributes.arn
      } : tomap({})
    }
  })
}
