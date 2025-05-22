moved {
  from = kubernetes_manifest.this
  to   = module.addon.kubernetes_manifest.this
}

moved {
  from = helm_release.this
  to   = module.addon.helm_release.this
}

moved {
  from = helm_release.argo_application
  to   = module.addon.helm_release.argo_application
}

moved {
  from = aws_iam_role.this
  to   = module.addon-irsa["actions-runner-controller"].aws_iam_role.this
}

moved {
  from = aws_iam_role_policy_attachment.this_additional
  to   = module.addon-irsa["actions-runner-controller"].aws_iam_role_policy_attachment.this_additional
}
